import 'dart:async';
import 'package:flutter/material.dart';
import 'package:profile_flutter/models/resume_data.dart';
import 'package:url_launcher/url_launcher.dart';
// import '../../models/resume_data.dart' hide Education, Job;

// --- CUSTOM WIDGETS ---

class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? url; // Optional URL for clickable actions

  const ContactInfo({super.key, required this.icon, required this.text, this.url});

  Future<void> _launchURL() async {
    if (url != null) {
      final Uri uri = Uri.parse(url!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        // Handle error, e.g., show a SnackBar or print to console
        print('Could not launch $url');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isClickable = url != null;
    return GestureDetector(
        onTap: isClickable ? _launchURL : null,
        child: MouseRegion( // For web, show pointer cursor
          cursor: isClickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: isClickable ? BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ) : null,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.onSurface, size: 20),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isClickable ? Theme.of(context).colorScheme.onSurface : null,
                    fontWeight: isClickable ? FontWeight.w600 : FontWeight.normal,
                  )),
                ),
              ],
            ),
          ),
        )
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final Job job;
  const ExperienceCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 24.0),
      color: Theme.of(context).cardTheme.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(job.title, style: textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                      Text('${job.company}, ${job.location}', style: textTheme.bodyMedium),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(job.period, style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...job.responsibilities.map((r) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle_outline, size: 16, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),
                  const SizedBox(width: 8),
                  Expanded(child: Text(r, style: textTheme.bodyLarge)),
                ],
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }
}

class SkillBar extends StatelessWidget {
  final Skill skill;
  const SkillBar({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(skill.name, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
            Text('${(skill.progress * 100).toInt()}%', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: skill.progress,
            backgroundColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            color: Theme.of(context).colorScheme.onSurface,
            minHeight: 10,
          ),
        ),
        const SizedBox(height: 8), // Spacing between skill bars
      ],
    );
  }
}

class EducationItem extends StatelessWidget {
  final Education education;
  const EducationItem({super.key, required this.education});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 0,
      color: Colors.transparent, // Transparent to blend with background if needed
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.2))
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
              child: Icon(Icons.school, color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(education.degree, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  Text(education.institution, style: textTheme.bodyMedium),
                ],
              ),
            ),
            Text(education.period, style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      color: Theme.of(context).cardTheme.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.onSurface.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.code, color: colorScheme.onSurface),
            ),
            const SizedBox(height: 16),
            Text(project.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(
              project.description,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: project.technologies.map((tech) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: colorScheme.onSurface.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(tech, style: TextStyle(fontSize: 12, color: colorScheme.onSurface)),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;
  const TestimonialCard({super.key, required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).cardTheme.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.format_quote, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5), size: 32),
            const SizedBox(height: 12),
            Text(
              '"${testimonial.text}"',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16),
            Text(testimonial.name, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
            Text(testimonial.role, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

// --- CHAT BOT WIDGET ---

class ChatBotSheet extends StatefulWidget {
  const ChatBotSheet({super.key});

  @override
  State<ChatBotSheet> createState() => _ChatBotSheetState();
}

class _ChatBotSheetState extends State<ChatBotSheet> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _messages = [];
  bool _isTyping = false;

  // FAQ Data Structure
  final List<Map<String, String>> _faqs = [
    {'topic': 'Services', 'question': 'What services do you offer?', 'answer': 'I specialize in building high-performance cross-platform applications using Flutter. My services include mobile app development, web apps, POS systems, Android TV applications, and real-time features like chat and live updates.'},
    {'topic': 'Apps Developed', 'question': 'What kind of applications have you developed?', 'answer': 'I have developed a wide range of applications including:\n\n• News portal apps with real-time updates\n• POS and billing systems with thermal printing\n• Short video and messaging platforms\n• Business and e-commerce applications'},
    {'topic': 'Platforms', 'question': 'Do you develop apps for both Android and iOS?', 'answer': 'Yes, I develop cross-platform applications using Flutter, ensuring seamless performance on both Android and iOS from a single codebase.'},
    {'topic': 'Web Apps', 'question': 'Can you build responsive web applications?', 'answer': 'Yes, I create responsive Flutter web applications that adapt to different screen sizes, ensuring a smooth experience across desktop, tablet, and mobile devices.'},
    {'topic': 'Real-time', 'question': 'Do you work with real-time features?', 'answer': 'Yes, I have experience implementing real-time systems using socket-based communication for features like live chat, notifications, and dynamic content updates.'},
    {'topic': 'Integrations', 'question': 'Do you integrate third-party services and APIs?', 'answer': 'Absolutely. I integrate REST APIs, payment gateways, Google Maps, Firebase services, and other third-party tools to extend application functionality.'},
    {'topic': 'Tech Stack', 'question': 'What technologies do you use alongside Flutter?', 'answer': 'In addition to Flutter and Dart, I work with:\n\n• Firebase\n• Node.js and Express\n• MongoDB\n• Django (basic experience)'},
    {'topic': 'Backend', 'question': 'Do you provide backend development as well?', 'answer': 'Yes, I have experience building scalable backend systems using Node.js, including RESTful APIs, authentication systems, and database design.'},
    {'topic': 'Projects', 'question': 'Can you work on existing projects?', 'answer': 'I can both develop new applications from scratch and improve or maintain existing projects, including performance optimization and feature enhancements.'},
    {'topic': 'Publishing', 'question': 'Do you publish apps on the Play Store and App Store?', 'answer': 'Yes, I handle the complete deployment process including app signing, configuration, and submission to both Google Play Store and Apple App Store.'},
    {'topic': 'Performance', 'question': 'How do you ensure app performance and quality?', 'answer': 'I focus on clean architecture, efficient state management, code optimization, and thorough testing to deliver high-performance and scalable applications.'},
    {'topic': 'POS/Hardware', 'question': 'Experience with POS and hardware integrations?', 'answer': 'I have worked with POS systems, including integration with thermal printers using socket-based communication for fast and reliable billing solutions.'},
    {'topic': 'UI/UX', 'question': 'Do you support UI/UX design improvements?', 'answer': 'Yes, I collaborate closely with designers and also contribute to improving UI/UX to ensure the application is intuitive and user-friendly.'},
    {'topic': 'Availability', 'question': 'Are you available for freelance or full-time opportunities?', 'answer': 'Yes, I am open to freelance projects, contract work, and full-time opportunities depending on the project scope and requirements.'},
    {'topic': 'Contact', 'question': 'How can I contact you?', 'answer': 'You can reach me via email at linkinshrestha@gmail.com or via LinkedIn for project discussions.'},
  ];

  @override
  void initState() {
    super.initState();
    // Initial greeting
    _addBotMessage("Hello! 👋 I'm Nikhil's virtual assistant.\n\nI can answer questions about my services, tech stack, and experience. Select a topic below to start!");
  }

  void _addBotMessage(String text) {
    setState(() {
      _messages.add({'isUser': false, 'text': text});
    });
    _scrollToBottom();
  }

  void _handleOptionSelected(int index) {
    final faq = _faqs[index];
    // Add user message
    setState(() {
      _messages.add({'isUser': true, 'text': faq['question']});
      _isTyping = true;
    });
    _scrollToBottom();

    // Simulate typing delay
    Timer(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() {
          _isTyping = false;
          _addBotMessage(faq['answer']!);
        });
        
        // If contact is selected, try to open mail after a short delay
        if (faq['topic'] == 'Contact') {
             // Optional: trigger email launch automatically or show a button
        }
      }
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _openMail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'linkinshrestha@gmail.com',
      query: 'subject=Inquiry from Portfolio&body=Hi Nikhil, I saw your portfolio and...',
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      height: MediaQuery.of(context).size.height * 0.85, // 85% of screen height
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // --- Header ---
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
            ),
            child: Row(
              children: [
                 CircleAvatar(
                  backgroundColor: colorScheme.onSurface.withOpacity(0.1),
                  child: Icon(Icons.smart_toy, color: colorScheme.onSurface),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Virtual Assistant", style: Theme.of(context).textTheme.titleLarge),
                      Row(
                        children: [
                          Container(width: 8, height: 8, decoration: BoxDecoration(color: colorScheme.onSurface.withOpacity(0.6), shape: BoxShape.circle)),
                          const SizedBox(width: 6),
                          Text(_isTyping ? "Typing..." : "Online", style: Theme.of(context).textTheme.bodySmall),
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
              ],
            ),
          ),

          // --- Chat Area ---
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(20),
              itemCount: _messages.length + (_isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _messages.length && _isTyping) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12, left: 44),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardTheme.color,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: SizedBox(width: 24, height: 10, child: LinearProgressIndicator(minHeight: 2, color: colorScheme.onSurface)),
                    ),
                  );
                }

                final msg = _messages[index];
                final isUser = msg['isUser'];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isUser) ...[
                         CircleAvatar(
                          radius: 16,
                          backgroundColor: colorScheme.onSurface,
                          child: Icon(Icons.smart_toy, size: 18, color: colorScheme.surface),
                        ),
                        const SizedBox(width: 12),
                      ],
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isUser ? colorScheme.onSurface : Theme.of(context).cardTheme.color,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(20),
                              topRight: const Radius.circular(20),
                              bottomLeft: isUser ? const Radius.circular(20) : Radius.zero,
                              bottomRight: isUser ? Radius.zero : const Radius.circular(20),
                            ),
                            border: !isUser ? Border.all(color: Theme.of(context).dividerColor.withOpacity(0.1)) : null,
                          ),
                          child: Text(
                            msg['text'],
                            style: TextStyle(color: isUser ? colorScheme.surface : Theme.of(context).textTheme.bodyMedium?.color, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // --- Suggestion Chips ---
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border(top: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.1)))
            ),
            child: SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _faqs.length,
                separatorBuilder: (c, i) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return ActionChip(
                    label: Text(_faqs[index]['topic']!),
                    backgroundColor: Theme.of(context).cardTheme.color,
                    elevation: 1,
                    side: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.2)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onPressed: () => _handleOptionSelected(index),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
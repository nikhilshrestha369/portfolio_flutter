import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/resume_data.dart';

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
              color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ) : null,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.primary, size: 20),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isClickable ? Theme.of(context).colorScheme.primary : null,
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
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
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
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(job.title, style: textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.primary)),
                      Text('${job.company}, ${job.location}', style: textTheme.bodyMedium),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
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
                  Icon(Icons.check_circle_outline, size: 16, color: Theme.of(context).colorScheme.secondary),
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
            backgroundColor: Colors.grey.shade200,
            color: Theme.of(context).colorScheme.primary,
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
          side: BorderSide(color: Colors.grey.shade300)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(Icons.school, color: Theme.of(context).colorScheme.primary),
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

// --- CHAT BOT WIDGET ---

class ChatBotSheet extends StatelessWidget {
  const ChatBotSheet({super.key});

  void _openMail() async {
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
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: const Icon(Icons.smart_toy, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: const Text("Hello! I'm Nikhil's virtual assistant. I can help you get in touch or answer questions about his work."),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            children: [
              ActionChip(
                avatar: const Icon(Icons.email_outlined, size: 18),
                label: const Text("Send an Email"),
                onPressed: _openMail,
              ),
              ActionChip(
                avatar: const Icon(Icons.copy, size: 18),
                label: const Text("Copy Phone"),
                onPressed: () {
                  // Simulating copy
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Phone number 9841466133 copied to clipboard!")),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
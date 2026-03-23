import 'package:flutter/material.dart';
import 'package:profile_flutter/models/resume_data.dart';
import 'package:profile_flutter/widgets/resume_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

// --- CV SECTIONS ---

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CircleAvatar(
            radius: 60,
            backgroundColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            child: ClipOval(
              child: Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              // Image.asset(
              //   'assets/profile.jpg',
              //   width: 120,
              //   height: 120,
              //   fit: BoxFit.cover,
              //   errorBuilder: (context, error, stackTrace) {
              //     return Icon(Icons.person, size: 80, color: Colors.blue.shade700);
              //   },
              // ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Nikhil Shrestha',
          style: textTheme.displayMedium?.copyWith(fontSize: 40),
        ),
        const SizedBox(height: 8),
        Text(
          'Flutter Developer',
          style: textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 16),
        const ContactInfo(
          icon: Icons.location_on,
          text: 'Gatthaghar, Madhyapur, Thimi, Nepal',
        ),
        const SizedBox(height: 8),
        const ContactInfo(
          icon: Icons.phone,
          text: '9841466133',
          url: 'tel:+9779841466133',
        ),
        const SizedBox(height: 8),
        const ContactInfo(
          icon: Icons.email,
          text: 'linkinshrestha@gmail.com',
          url: 'mailto:linkinshrestha@gmail.com',
        ),
      ],
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('PROFILE', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        Text(
          'Dynamic Mid-level Flutter Developer with over 3 years of experience in building cutting-edge, cross-platform mobile applications that drive user engagement and performance.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EMPLOYMENT HISTORY',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 24),
        ...employmentHistory.map((job) => ExperienceCard(job: job)).toList(),
      ],
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const Map<String, List<String>> skillGroups = {
      'Languages': [
        'Dart',
        'JavaScript',
        'Swift',
        'PHP',
        'Java',
        'Python',
      ],
      'Frameworks & Tools': [
        'Flutter',
        'iOS',
        'Android',
        'Stripe',
        'React',
        'Laravel',
        'PostgreSQL',
      ],
      'Others': [
        'Play Store',
        'GitHub',
        'REST API',
        'iOS Store',
        'Linux',
        'Docker',
        'AWS',
      ],
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EXPERTISE',
          style: theme.textTheme.labelLarge?.copyWith(
            letterSpacing: 4,
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.onSurface.withOpacity(0.75),
          ),
        ),
        const SizedBox(height: 20),

        ...skillGroups.entries.map(
          (entry) => Padding(
            padding: const EdgeInsets.only(bottom: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.key,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: entry.value
                      .map((skill) => _SkillChip(label: skill))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip({required this.label});

  IconData _getIcon(String label) {
    switch (label.toLowerCase()) {
      case 'dart':
        return Icons.flutter_dash;
      case 'javascript':
        return Icons.javascript;
      case 'swift':
        return Icons.phone_iphone;
      case 'php':
        return Icons.code;
      case 'java':
        return Icons.coffee;
      case 'python':
        return Icons.code_off;
      case 'flutter':
        return Icons.flutter_dash;
      case 'ios':
        return Icons.apple;
      case 'android':
        return Icons.android;
      case 'stripe':
        return Icons.payment;
      case 'react':
        return Icons.hub;
      case 'laravel':
        return Icons.web;
      case 'postgresql':
        return Icons.storage;
      case 'play store':
        return Icons.shop;
      case 'github':
        return Icons.code;
      case 'rest api':
        return Icons.api;
      case 'ios store':
        return Icons.apple;
      case 'linux':
        return Icons.computer;
      case 'docker':
        return Icons.inventory_2;
      case 'aws':
        return Icons.cloud;
      default:
        return Icons.star_border;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.onSurface.withOpacity(0.12),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getIcon(label),
            size: 18,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('EDUCATION', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        ...educationHistory
            .map((edu) => EducationItem(education: edu))
            .toList(),
      ],
    );
  }
}

class RecentWorkSection extends StatelessWidget {
  const RecentWorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final int crossAxisCount = width > 900 ? 2 : 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('RECENT WORK', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.5,
          ),
          itemCount: recentProjects.length,
          itemBuilder: (context, index) {
            return ProjectCard(project: recentProjects[index]);
          },
        ),
      ],
    );
  }
}

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('TESTIMONIALS', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 24),
        ...testimonials
            .map(
              (t) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TestimonialCard(testimonial: t),
              ),
            )
            .toList(),
      ],
    );
  }
}

class GetInTouchSection extends StatelessWidget {
  const GetInTouchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            "Let's Work Together!",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          const Text(
            "Have a project in mind or want to hire me? I'm just a click away.",
          ),
          const SizedBox(height: 24),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.onSurface,
              foregroundColor: Theme.of(context).colorScheme.surface,
            ),
            onPressed: () async {
              final Uri url = Uri.parse('mailto:linkinshrestha@gmail.com');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            child: const Text("Get in Touch"),
          ),
        ],
      ),
    );
  }
}
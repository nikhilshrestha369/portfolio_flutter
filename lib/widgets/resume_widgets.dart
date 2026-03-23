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
    return GestureDetector(
        onTap: url != null ? _launchURL : null,
        child: MouseRegion( // For web, show pointer cursor
          cursor: url != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
          child: Row(
            children: [
              Icon(icon, color: Colors.blue.shade700, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  decoration: url != null ? TextDecoration.underline : TextDecoration.none,
                  color: url != null ? Colors.blue.shade700 : null,
                )),
              ),
            ],
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
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 24.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job.period, style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
            const SizedBox(height: 4),
            Text(job.title, style: textTheme.titleLarge?.copyWith(color: Colors.blue.shade800)),
            const SizedBox(height: 4),
            Text('${job.company}, ${job.location}', style: textTheme.bodyLarge?.copyWith(fontStyle: FontStyle.italic)),
            const SizedBox(height: 12),
            ...job.responsibilities.map((r) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontSize: 16, color: Colors.blue)),
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
        Text(skill.name, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: skill.progress,
          backgroundColor: Colors.grey.shade300,
          color: Colors.blue.shade700,
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
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
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(education.period, style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
            const SizedBox(height: 4),
            Text(education.degree, style: textTheme.titleLarge?.copyWith(fontSize: 18, color: Colors.blue.shade800)),
            const SizedBox(height: 2),
            Text(education.institution, style: textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
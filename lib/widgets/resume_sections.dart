import 'package:flutter/material.dart';
import '../../models/resume_data.dart';
import 'resume_widgets.dart';

// --- CV SECTIONS ---

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 4),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8)],
          ),
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            child: ClipOval(
              child: Icon(Icons.person, size: 80, color: Theme.of(context).colorScheme.primary),
              // Image.asset(
              //   'assets/profile.jpg',
              //   ...
              // ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Nikhil Shrestha',
          style: textTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Flutter Developer',
          style: textTheme.headlineSmall?.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(height: 24),
        const Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
          ContactInfo(
          icon: Icons.location_on,
          text: 'Gatthaghar, Madhyapur, Thimi, Nepal',
        ),
        ContactInfo(
          icon: Icons.phone,
          text: '9841466133',
          url: 'tel:+9779841466133', // Make phone number clickable
        ),
        ContactInfo(
          icon: Icons.email,
          text: 'linkinshrestha@gmail.com',
          url: 'mailto:linkinshrestha@gmail.com', // Make email clickable
        ),
          ],
        ),
      ],
      )
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
        Text('EMPLOYMENT HISTORY', style: Theme.of(context).textTheme.headlineSmall),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.bolt, color: Theme.of(context).colorScheme.secondary),
            const SizedBox(width: 8),
            Text('SKILLS', style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
        const SizedBox(height: 16),
        Column( // Changed from Wrap to Column for LinearProgressIndicator
          children: skills.map((skill) => SkillBar(skill: skill)).toList(),
        )
      ],
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
        ...educationHistory.map((edu) => EducationItem(education: edu)).toList(),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import '../../models/resume_data.dart';
import 'resume_widgets.dart';

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
            backgroundColor: Colors.blue.shade100, // Fallback background color
            child: ClipOval(
              child: Icon(Icons.person, size: 80, color: Colors.blue.shade700),
              // Image.asset(
              //   'assets/profile.jpg',
              //   width: 120,
              //   height: 120,
              //   fit: BoxFit.cover,
              //   errorBuilder: (context, error, stackTrace) {
              //     return Icon(Icons.person, size: 80, color: Colors.blue.shade700); // Fallback icon
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
          style: textTheme.headlineSmall?.copyWith(color: Colors.blue.shade700),
        ),
        const SizedBox(height: 16),
        const ContactInfo(
          icon: Icons.location_on,
          text: 'Gatthaghar, Madhyapur, Thimi, Nepal',
          // No URL for location directly, unless it's a map link
        ),
        const SizedBox(height: 8),
        const ContactInfo(
          icon: Icons.phone,
          text: '9841466133',
          url: 'tel:+9779841466133', // Make phone number clickable
        ),
        const SizedBox(height: 8),
        const ContactInfo(
          icon: Icons.email,
          text: 'linkinshrestha@gmail.com',
          url: 'mailto:linkinshrestha@gmail.com', // Make email clickable
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
        Text('SKILLS', style: Theme.of(context).textTheme.headlineSmall),
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
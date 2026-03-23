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
            backgroundColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            child: ClipOval(
              child: Icon(Icons.person, size: 80, color: Theme.of(context).colorScheme.onSurface),
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
          style: textTheme.headlineSmall?.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),
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

class RecentWorkSection extends StatelessWidget {
  const RecentWorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate crossAxisCount based on width (simple responsive logic for grid)
    double width = MediaQuery.of(context).size.width;
    int crossAxisCount = width > 900 ? 2 : 1;

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
            childAspectRatio: 1.5, // Adjust card height
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
        ...testimonials.map((t) => Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TestimonialCard(testimonial: t),
        )).toList(),
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
          Text("Let's Work Together!", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          const Text("Have a project in mind or want to hire me? I'm just a click away."),
          const SizedBox(height: 24),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.onSurface,
              foregroundColor: Theme.of(context).colorScheme.surface,
            ),
            onPressed: () async {
              final Uri url = Uri.parse('mailto:linkinshrestha@gmail.com');
              if (await canLaunchUrl(url)) await launchUrl(url);
            },
            child: const Text("Get in Touch"),
          ),
        ],
      ),
    );
  }
}
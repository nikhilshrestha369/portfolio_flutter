import 'package:flutter/material.dart';
import 'package:profile_flutter/models/resume_data.dart';
import 'package:profile_flutter/widgets/resume_widgets.dart';

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
              child: Container(
                width: 120, height: 120,
                color: Theme.of(context).colorScheme.onSurface,
                child: Icon(Icons.person, size: 80, color: Theme.of(context).colorScheme.surface),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          personalInfo.name.toUpperCase(),
          style: textTheme.displayMedium?.copyWith(
            fontSize: 40,
            fontWeight: FontWeight.w900,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          personalInfo.role,
          style: textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            fontFamily: 'monospace',
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        ContactInfo(
          icon: Icons.location_on,
          text: personalInfo.location,
        ),
        const SizedBox(height: 8),
        ContactInfo(
          icon: Icons.phone,
          text: personalInfo.phone,
          url: personalInfo.phoneUrl,
        ),
        const SizedBox(height: 8),
        ContactInfo(
          icon: Icons.email,
          text: personalInfo.email,
          url: personalInfo.emailUrl,
        ),
      ],
    );
  }
}
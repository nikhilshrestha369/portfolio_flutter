import 'package:flutter/material.dart';
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
              child: Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.onSurface,
              ),
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
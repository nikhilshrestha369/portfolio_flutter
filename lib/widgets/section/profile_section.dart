import 'package:flutter/material.dart';

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
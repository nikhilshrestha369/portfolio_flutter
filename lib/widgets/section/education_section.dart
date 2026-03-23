import 'package:flutter/material.dart';
import 'package:profile_flutter/models/resume_data.dart';
import 'package:profile_flutter/widgets/resume_widgets.dart';

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
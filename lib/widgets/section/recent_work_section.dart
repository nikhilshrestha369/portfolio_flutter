import 'package:flutter/material.dart';
import 'package:profile_flutter/models/resume_data.dart';
import 'package:profile_flutter/widgets/resume_widgets.dart';

class RecentWorkSection extends StatelessWidget {
  const RecentWorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    double cardWidth;
    if (width >= 1200) {
      cardWidth = (width - 64 - 24) / 2; // 2 columns with gap
      cardWidth = cardWidth.clamp(420, 560);
    } else if (width >= 800) {
      cardWidth = (width - 48 - 20) / 2;
      cardWidth = cardWidth.clamp(360, 500);
    } else {
      cardWidth = width - 32;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'RECENT WORKS',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      letterSpacing: 6,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 24),
              Text(
                'Here are some of my favorite projects I have done lately. Feel free to check them out.',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      height: 1.4,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 24,
                runSpacing: 24,
                children: recentProjects
                    .map(
                      (project) => SizedBox(
                        width: cardWidth,
                        child: ProjectCard(project: project),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
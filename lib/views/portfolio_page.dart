import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:profile_flutter/widgets/resume_widgets.dart';
import '../controllers/theme_controller.dart';

import '../widgets/resume_sections.dart';

// The main portfolio page, which is responsive
class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      // Add a nice background using Stack
      body: Stack(
        children: [
          // Main Content
          const MobileView(),
      
          Positioned(
            top: 24,
            right: 24,
            child: Consumer<ThemeController>(
              builder: (context, controller, child) {
                return IconButton(
                  onPressed: () => controller.toggleTheme(),
                  icon: Icon(
                    controller.isDark(context) ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true, // Allows the sheet to take up more height
            backgroundColor: Colors.transparent,
            builder: (context) => const ChatBotSheet(),
          );
        },
        icon: const Icon(Icons.chat_bubble_outline),
        label: const Text("Assistant"),
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        foregroundColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}

// --- RESPONSIVE LAYOUTS ---
class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            SizedBox(height: 32),
            ProfileSection(),
            SizedBox(height: 32),
            ExperienceSection(),
            SizedBox(height: 32),
            SkillsSection(),
            SizedBox(height: 32),
            EducationSection(),
            SizedBox(height: 32),
            RecentWorkSection(),
            SizedBox(height: 32),
            TestimonialsSection(),
            SizedBox(height: 32),
            GetInTouchSection(),
          ],
        ),
      ),
    );
  }
}

// --- LAYOUT COMPONENTS ---

class SidePanel extends StatelessWidget {
  const SidePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: const SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            SizedBox(height: 40),
            SkillsSection(),
            SizedBox(height: 40),
            EducationSection(),
           
          ],
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileSection(),
          SizedBox(height: 40),
          ExperienceSection(),
          SizedBox(height: 40),
          RecentWorkSection(),
          SizedBox(height: 40),
           TestimonialsSection(),
          SizedBox(height: 40),
          GetInTouchSection(),
        ],
      ),
    );
  }
}
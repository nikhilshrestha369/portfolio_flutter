import 'package:flutter/material.dart';
import '../../widgets/resume_sections.dart';
import '../widgets/resume_widgets.dart'; // Import for ChatBotSheet

// The main portfolio page, which is responsive
class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add a nice background using Stack
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.background,
                  Colors.white,
                ],
              ),
            ),
          ),
          // Main Content
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 900) {
                return const DesktopView();
              } else {
                return const MobileView();
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => const ChatBotSheet(),
          );
        },
        icon: const Icon(Icons.chat_bubble_outline),
        label: const Text("Assistant"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
    );
  }
}

// --- RESPONSIVE LAYOUTS ---

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 350,
          child: SidePanel(),
        ),
        Expanded(
          child: MainContent(),
        ),
      ],
    );
  }
}

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
      color: Colors.white.withOpacity(0.8), // Semi-transparent
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
        ],
      ),
    );
  }
}
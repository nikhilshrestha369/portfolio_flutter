import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:profile_flutter/models/resume_data.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    _fade = Tween<double>(begin: 0, end: 1).animate(_controller);

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 800;

    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.purple.withOpacity(0.15),
                Colors.blue.withOpacity(0.15),
              ],
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Column(
                crossAxisAlignment:
                    isWeb ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                children: [
                  /// TITLE
                  // Row(
                  //   mainAxisAlignment: isWeb
                  //       ? MainAxisAlignment.start
                  //       : MainAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       width: 6,
                  //       height: 24,
                  //       decoration: BoxDecoration(
                  //         gradient: const LinearGradient(
                  //           colors: [Colors.blue, Colors.purple],
                  //         ),
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 12),
                  //     // Text(
                  //     //   '/ PROFILE',
                  //     //   style: Theme.of(context)
                  //     //       .textTheme
                  //     //       .titleMedium
                  //     //       ?.copyWith(
                  //     //         fontFamily: 'monospace',
                  //     //         fontWeight: FontWeight.bold,
                  //     //         letterSpacing: 1.2,
                  //     //       ),
                  //     // ),
                  //   ],
                  // ),

                  const SizedBox(height: 20),

                  /// BIO TEXT
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          height: 1.8,
                          fontSize: isWeb ? 18 : 16,
                          color: Colors.white.withOpacity(0.85),
                        ),
                    child: Text(
                      personalInfo.bio,
                      textAlign: isWeb ? TextAlign.start : TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// OPTIONAL TAGS / SKILLS (futuristic touch)
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: isWeb
                        ? WrapAlignment.start
                        : WrapAlignment.center,
                    children: [
                      _buildTag("Flutter"),
                      _buildTag("Dart"),
                      _buildTag("REST APIs"),
                      _buildTag("UI/UX"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white24),
        color: Colors.white.withOpacity(0.05),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 13),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:profile_flutter/models/resume_data.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EXPERTISE',
          style: theme.textTheme.labelLarge?.copyWith(
            letterSpacing: 4,
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.onSurface.withOpacity(0.75),
          ),
        ),
        const SizedBox(height: 20),

        ...skillGroups.entries.map(
          (entry) => Padding(
            padding: const EdgeInsets.only(bottom: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.key,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: entry.value
                      .map((skill) => _SkillChip(label: skill))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip({required this.label});

  IconData _getIcon(String label) {
    switch (label.toLowerCase()) {
      case 'dart':
        return Icons.flutter_dash;
      case 'javascript':
        return Icons.javascript;
      case 'swift':
        return Icons.phone_iphone;
      case 'php':
        return Icons.code;
      case 'java':
        return Icons.coffee;
      case 'python':
        return Icons.code_off;
      case 'flutter':
        return Icons.flutter_dash;
      case 'ios':
        return Icons.apple;
      case 'android':
        return Icons.android;
      case 'stripe':
        return Icons.payment;
      case 'react':
        return Icons.hub;
      case 'laravel':
        return Icons.web;
      case 'postgresql':
        return Icons.storage;
      case 'play store':
        return Icons.shop;
      case 'github':
        return Icons.code;
      case 'rest api':
        return Icons.api;
      case 'ios store':
        return Icons.apple;
      case 'linux':
        return Icons.computer;
      case 'docker':
        return Icons.inventory_2;
      case 'aws':
        return Icons.cloud;
      default:
        return Icons.star_border;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: theme.colorScheme.onSurface.withOpacity(0.12),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getIcon(label),
            size: 18,
            color: theme.colorScheme.onSurface,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
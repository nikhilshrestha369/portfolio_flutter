import 'package:flutter/material.dart';
import 'package:profile_flutter/models/resume_data.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('TESTIMONIALS', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 24),
        ...testimonials
            .map(
              (t) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TestimonialCard(testimonial: t),
              ),
            )
            .toList(),
      ],
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;
  const TestimonialCard({super.key, required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).cardTheme.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.format_quote, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5), size: 32),
            const SizedBox(height: 12),
            Text(
              '"${testimonial.text}"',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16),
            Text(testimonial.name, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
            Text(testimonial.role, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

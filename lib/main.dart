import 'package:flutter/material.dart';
import 'views/portfolio_page.dart';

// Main entry point of the application
void main() {
  runApp(const PortfolioApp());
}

// The root widget of the application
class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nikhil Shrestha - Flutter Developer',
      // Use Material 3 for a modern look
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB), // Professional Royal Blue
          secondary: const Color(0xFF0EA5E9), // Sky Blue
          background: const Color(0xFFF8FAFC), // Very light slate gray
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        cardTheme: CardThemeData(
          elevation: 0, // Flat design with border/color
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: Colors.white,
          surfaceTintColor: Colors.white, // Removes pinkish tint on elevation
        ),
        textTheme: TextTheme(
          displayMedium: const TextStyle(fontSize: 42, fontWeight: FontWeight.w800, color: Color(0xFF1E293B)),
          headlineSmall: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF334155), letterSpacing: 1.2),
          titleLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF1E293B)),
          bodyLarge: const TextStyle(fontSize: 16, color: Color(0xFF475569), height: 1.5),
          bodyMedium: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
        ),
      ),
      home: const PortfolioPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/theme_controller.dart';
import 'views/portfolio_page.dart';

// Main entry point of the application
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()),
      ],
      child: const PortfolioApp(),
    ),
  );
}

// The root widget of the application
class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);

    // --- Light Theme ---
    final lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2563EB),
        secondary: const Color(0xFF0EA5E9),
        background: const Color(0xFFF8FAFC),
        surface: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      textTheme: const TextTheme(
        displayMedium: TextStyle(fontSize: 42, fontWeight: FontWeight.w800, color: Color(0xFF1E293B)),
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF334155), letterSpacing: 1.2),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF1E293B)),
        bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF475569), height: 1.5),
        bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
      ),
    );

    // --- Dark Futuristic Theme ---
    final darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color(0xFF00E5FF), // Neon Cyan
        primary: const Color(0xFF00E5FF),
        secondary: const Color(0xFFD946EF), // Neon Purple accent
        background: const Color(0xFF0F172A), // Dark Slate
        surface: const Color(0xFF1E293B), // Slightly lighter slate
      ),
      scaffoldBackgroundColor: const Color(0xFF0F172A),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: const Color(0xFF1E293B).withOpacity(0.7), // Glassy dark card
        surfaceTintColor: const Color(0xFF00E5FF),
      ),
      iconTheme: const IconThemeData(color: Color(0xFF00E5FF)),
      textTheme: const TextTheme(
        displayMedium: TextStyle(fontSize: 42, fontWeight: FontWeight.w800, color: Color(0xFFF1F5F9)),
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFE2E8F0), letterSpacing: 1.2),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFFF8FAFC)),
        bodyLarge: TextStyle(fontSize: 16, color: Color(0xFFCBD5E1), height: 1.5),
        bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nikhil Shrestha - Portfolio',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeController.themeMode,
      home: const PortfolioPage(),
    );
  }
}

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
      theme: ThemeData(
        primaryColor: Colors.blue.shade700,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.tealAccent),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color(0xFFF0F2F5), // Lighter background
        cardTheme: CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: EdgeInsets.zero, // Handled by parent padding
        ),
        textTheme: TextTheme(
          displayMedium: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212121)),
          headlineSmall: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212121)),
          titleLarge: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212121)),
          bodyLarge: TextStyle(fontSize: 17, color: const Color(0xFF424242)),
          bodyMedium: TextStyle(fontSize: 15, color: const Color(0xFF616161)),
        ),
      ),
      home: const PortfolioPage(),
    );
  }
}

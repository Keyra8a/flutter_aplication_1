import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

void main() {
  runApp(const SowAndSewApp());
}

class SowAndSewApp extends StatelessWidget {
  const SowAndSewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sow & Sew · Lino Organic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFAF8F3),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1D3B2A),
          primary: const Color(0xFF1D3B2A),
          surface: const Color(0xFFFAF8F3),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

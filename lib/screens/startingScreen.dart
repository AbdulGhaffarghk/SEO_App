// FILE: lib/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import '../constants.dart'; // Import color constants
import 'onBoardingScreen.dart'; // Import the onboarding screen
import 'loginScreen.dart'; // Import the login screen (and HomeScreen)

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus(); // Check login status immediately
  }

  Future<void> _checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? emailOrPhone = prefs.getString('emailOrPhone');
    final String? password = prefs.getString('password');

    // Introduce a minimum delay for the splash screen
    await Future.delayed(const Duration(seconds: 3));

    if (emailOrPhone != null && password != null && emailOrPhone.isNotEmpty && password.isNotEmpty) {
      // User is already "logged in" (has credentials stored)
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()), // Navigate to home if logged in
        );
      }
    } else {
      // No credentials, proceed to onboarding
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnboardingScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
      body: Center(
        // The "learner" logo
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'learn',
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold,
                letterSpacing: -1,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: primaryOrange,
                shape: BoxShape.circle,
              ),
              child: const Text(
                'er',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
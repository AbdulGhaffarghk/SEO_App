
import 'package:flutter/material.dart';
import 'package:seo/constants.dart';
import 'package:seo/widgets/socialButtons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginScreen.dart';

class SignUpScreen extends StatefulWidget { // Change to StatefulWidget
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to save user data
  Future<void> _saveUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName', _fullNameController.text);
    await prefs.setString('emailOrPhone', _emailPhoneController.text);
    // WARNING: Storing password directly in Shared Preferences is INSECURE.
    // For a real app, hash and salt passwords, or use flutter_secure_storage.
    await prefs.setString('password', _passwordController.text);

    // After saving, navigate to login
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created successfully!')),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: textBlack),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: textBlack,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Start your learning journey with us!',
                style: TextStyle(fontSize: 16, color: textGrey),
              ),
              const SizedBox(height: 48),

              // --- Full Name Field ---
              TextField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  hintText: 'Full Name',
                  prefixIcon: Icon(Icons.person_outline, color: textGrey),
                ),
              ),
              const SizedBox(height: 20),

              // --- Email/Phone Field ---
              TextField(
                controller: _emailPhoneController,
                decoration: const InputDecoration(
                  hintText: 'Email or Phone Number',
                  prefixIcon: Icon(Icons.email_outlined, color: textGrey),
                ),
              ),
              const SizedBox(height: 20),

              // --- Password Field ---
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline, color: textGrey),
                ),
              ),
              const SizedBox(height: 24),

              // --- Sign Up Button ---
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveUserData, // Call the save function
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // --- Or Divider ---
              const Row(
                children: [
                  Expanded(child: Divider(color: textGrey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('OR', style: TextStyle(color: textGrey)),
                  ),
                  Expanded(child: Divider(color: textGrey)),
                ],
              ),
              const SizedBox(height: 24),

              // --- Google Sign Up ---
              SocialButton(
                text: 'Sign up with Google',
                iconPath: 'https://img.icons8.com/color/48/000000/google-logo.png',
                onPressed: () {
                  // Implement Google Sign-Up logic here (beyond shared_preferences scope)
                },
              ),
              const SizedBox(height: 48),

              // --- Login Navigation ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?", style: TextStyle(color: textGrey)),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// FILE: lib/screens/loginScreen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import '../constants.dart';
import '../widgets/socialButtons.dart';
import 'signUp.dart';
import 'package:flutter/material.dart'; // Or create a dedicated home screen file

// Placeholder for a screen after successful login
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome!'),
        automaticallyImplyLeading: false, // Hide back button
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear(); // Clear all stored data (including login info)
              if (context.mounted) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                      (Route<dynamic> route) => false,
                );
              }
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'You are logged in!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}


class LoginScreen extends StatefulWidget { // Change to StatefulWidget
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle login
  Future<void> _loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? storedEmailOrPhone = prefs.getString('emailOrPhone');
    final String? storedPassword = prefs.getString('password');

    if (_emailPhoneController.text == storedEmailOrPhone &&
        _passwordController.text == storedPassword) {
      // Successful login
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login successful!')),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    } else {
      // Failed login
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid User or password. Please try again.')),
        );
      }
    }
  }

  @override
  void dispose() {
    _emailPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: textBlack,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Log in to your account to continue.',
                style: TextStyle(fontSize: 16, color: textGrey),
              ),
              const SizedBox(height: 48),

              // --- Email/Phone Field ---
              TextField(
                controller: _emailPhoneController,
                decoration: const InputDecoration(
                  hintText: 'Email or Phone Number',
                  prefixIcon: Icon(Icons.person_outline, color: textGrey),
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
              const SizedBox(height: 12),

              // --- Forgot Password ---
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // --- Login Button ---
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _loginUser, // Call the login function
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Log In',
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

              // --- Google Sign In ---
              SocialButton(
                text: 'Sign in with Google',
                iconPath: 'https://img.icons8.com/color/48/000000/google-logo.png',
                onPressed: () {
                  // Implement Google Sign-In logic here
                },
              ),
              const SizedBox(height: 48),

              // --- Sign Up Navigation ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?", style: TextStyle(color: textGrey)),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const SignUpScreen()),
                      );
                    },
                    child: const Text(
                      'Sign Up',
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
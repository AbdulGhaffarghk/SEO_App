import 'package:flutter/material.dart';
import 'package:seo/constants.dart';


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: textBlack,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter your email or phone number to receive a password reset link.', // Updated text
                style: TextStyle(fontSize: 16, color: textGrey),
              ),
              const SizedBox(height: 48),

              // --- Email or Phone Number Field ---
              const TextField(
                keyboardType: TextInputType.emailAddress, // Keep it flexible, emailAddress allows @ and numbers
                decoration: InputDecoration(
                  hintText: 'Email or Phone Number', // Updated hint text
                  prefixIcon: Icon(Icons.person_outline, color: textGrey), // Using person_outline for flexibility
                ),
              ),
              const SizedBox(height: 32),

              // --- Send Reset Link Button ---
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement password reset logic based on email or phone
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password reset link sent (if account exists)!'), // Updated message
                        duration: Duration(seconds: 2),
                      ),
                    );
                    // After sending the link, you might want to pop back to the login screen
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Send Reset Link',
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
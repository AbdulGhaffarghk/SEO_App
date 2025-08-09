import 'package:flutter/material.dart';
import 'package:seo/screens/CoursesScreen.dart';
import 'package:seo/screens/DashBoardScreen.dart';
import 'package:seo/screens/Dashboard%20Screens/4ButtonScreen.dart';
import 'package:seo/screens/JobScreen.dart';
import 'package:seo/screens/Login%20and%20Sign%20up%20Screens/loginScreen.dart';
import 'package:seo/screens/Login%20and%20Sign%20up%20Screens/onBoardingScreen.dart';
import 'package:seo/screens/Login%20and%20Sign%20up%20Screens/startingScreen.dart';
import 'package:seo/screens/Profile%20Screens/freinds.dart';
import 'package:seo/screens/Profile%20Screens/privacy.dart';
import 'package:seo/screens/Profile%20Screens/profile.dart';
import 'package:seo/screens/Profile%20Screens/setting.dart';
import 'package:seo/screens/ProfileScreen.dart';
import '../constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learner App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: lightGrey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          hintStyle: const TextStyle(color: textGrey),
        ),
      ),
      debugShowCheckedModeBanner: false,

      initialRoute: '/startingScreen',
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/home': (context) => const DashBoardScreen(""),
        '/courses': (context) => CoursesScreen(),
        '/jobs': (context) => const Jobscreen(),
        '/profile': (context) => const ProfileScreen(),
        '/startingScreen': (context) => const SplashScreen(),
        'loginScreen': (context) => const LoginScreen(),

        //Profile Screens
        '/inviteFriends': (context) => InviteFriendsScreen(),
        '/privacyPolicy': (context) => PrivacyPolicyScreen(),
        '/editProfile': (context) => EditProfileScreen(),
        '/settings': (context) => SettingsScreen(),
      },
      
    );
  }
}

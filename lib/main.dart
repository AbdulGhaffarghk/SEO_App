import 'package:flutter/material.dart';
import 'package:seo/screens/CoursesScreen.dart';
import 'package:seo/screens/DashBoardScreen.dart';
import 'package:seo/screens/InboxScreen.dart';
import 'package:seo/screens/NthpScreen.dart';
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

      initialRoute: '/home',
      routes: {
        '/home': (context) => const DashBoardScreen(),
        '/courses': (context) => const CoursesScreen(),
        '/inbox': (context) => const InboxScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/nthp': (context) => const Nthpscreen(),
      },
      
    );
  }
}

import 'package:flutter/material.dart';
import 'package:seo/constants.dart';

import 'loginScreen.dart';

// Data model for each onboarding page
class OnboardingPageData {
  final String imagePath;
  final String title;
  final String coloredTitlePart;
  final String subtitle;

  OnboardingPageData({
    required this.imagePath,
    required this.title,
    required this.coloredTitlePart,
    required this.subtitle,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Content for the three onboarding pages using local asset paths
  final List<OnboardingPageData> _pages = [
    OnboardingPageData(
      imagePath: 'assets/onBoarding1.png', // This will be image1.png
      title: 'Easy learning, wherever & ',
      coloredTitlePart: 'wherever you want',
      subtitle: "Lorem Ipsum is simply dummy text of the Lorem Ipsum has been the industry's",
    ),
    OnboardingPageData(
      imagePath: 'assets/onBoarding2.jpg', // This will be the left image from image1
      title: 'Start your path to mastery ',
      coloredTitlePart: 'with teacher',
      subtitle: 'Lorem Ipsum is simply dummy text of the Lorem Ipsum has been the industry\'s',
    ),
    OnboardingPageData(
      imagePath: 'assets/onBoarding3.jpg', // This will be the right image from image2
      title: 'Join a community ',
      coloredTitlePart: 'of learners', // Keeping this text as it fits the "community" theme
      subtitle: 'Lorem Ipsum is simply dummy text of the Lorem Ipsum has been the industry\'s',
    ),
  ];

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: TextButton(
                  onPressed: _navigateToLogin,
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: textGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            // --- PageView for swipeable content ---
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Center( // Center the image within its flexible space
                      child: Image.asset(
                        _pages[index].imagePath,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(child: Icon(Icons.error, size: 100, color: textGrey));
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            // --- Content Card ---
            Expanded(
              flex: 2, // Allocate more space to the content card
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20.0,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // --- Title Text ---
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 26,
                          color: textBlack,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                          fontFamily: 'Inter',
                        ),
                        children: [
                          TextSpan(text: _pages[_currentPage].title),
                          TextSpan(
                            text: _pages[_currentPage].coloredTitlePart,
                            style: const TextStyle(color: primaryBlue),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // --- Subtitle Text ---
                    Text(
                      _pages[_currentPage].subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: textGrey,
                      ),
                    ),
                    const Spacer(), // Pushes content to top and bottom

                    // --- Bottom Row: Dots and Button ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // --- Progress Dots ---
                        Row(
                          children: List.generate(
                            _pages.length,
                                (index) => buildDot(index: index),
                          ),
                        ),

                        // --- Next Button ---
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_currentPage < _pages.length - 1) {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                _navigateToLogin();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryBlue,
                              shape: const CircleBorder(),
                              padding: EdgeInsets.zero,
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper Widget for Progress Dots ---
  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 8),
      height: 12,
      width: _currentPage == index ? 24 : 12,
      decoration: BoxDecoration(
        color: _currentPage == index ? primaryBlue : inactiveDot,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
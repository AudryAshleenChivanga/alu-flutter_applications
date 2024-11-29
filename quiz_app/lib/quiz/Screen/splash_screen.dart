import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/quiz/Screen/quiz_screen.dart';

class QuizSplashScreen extends StatelessWidget {
  const QuizSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff7b1fa2), // Purple gradient start
              Color(0xff512da8), // Purple gradient end
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.8, end: 1.2),
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                builder: (context, double scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: const Text(
                      "Quiz App",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              const Text(
                "Challenge Yourself!",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 40),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 2),
                builder: (context, double opacity, child) {
                  return Opacity(
                    opacity: opacity,
                    child: const Text(
                      "Welcome to the ultimate quiz experience. \nGet ready to test your knowledge!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 3),
                builder: (context, double value, child) {
                  return CircularProgressIndicator(
                    value: value,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xffd1c4e9), // Light purple
                    ),
                    backgroundColor: const Color(0xffb39ddb), // Soft purple
                  );
                },
              ),
              const SizedBox(height: 50),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.5, end: 1),
                duration: const Duration(seconds: 2),
                builder: (context, double scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const QuizScreen()); // GetX navigation
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: size.width * 0.7,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: const Color(0xffd1c4e9), // Button color
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Text(
                          "Start Quiz",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff512da8), // Text color
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mono/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/views/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


 void goToNext() {
  Timer(const Duration(seconds: 3), () {
    if (!mounted) return; // Prevent error if widget is disposed
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingView()),
    );
  });
}



@override
  void initState() {
    super.initState();
    goToNext();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Text(
          "mono",
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

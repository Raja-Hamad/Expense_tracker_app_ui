import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/utils/app_colors.dart';
import 'package:mono/views/authentication/signin_view.dart';
import 'package:mono/views/widgets/reusable_button.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Image.asset(
                "assets/images/onboarding.png",
                height: 400,
                width: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 30),
              Text(
                "Spend Smarter",
                style: GoogleFonts.inter(
                  color: Color(0xff438883),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Save More",
                style: GoogleFonts.inter(
                  color: Color(0xff438883),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 26),
              ReusableButton(title: "Get Started",
              onPress: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  SigninView(),
                    ),
                  );
              }),
              const SizedBox(height: 17),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Already have account? ",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: "Log In",
                      style: GoogleFonts.inter(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/utils/app_colors.dart';

class ReusableButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onPress;

  const ReusableButton({
    super.key,
    required this.title,
    required this.onPress,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: isLoading ? null : onPress,

      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    title,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

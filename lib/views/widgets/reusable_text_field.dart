import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ReusableTextField extends StatefulWidget {
  TextEditingController controller;
  String hintText;
  Icon suffixIcon;
  bool isPassword;
  double? width;

  ReusableTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.suffixIcon,
    required this.isPassword,
    this.width,
  });

  @override
  State<ReusableTextField> createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffDDDDDD), width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            obscureText: widget.isPassword,
            style: GoogleFonts.inter(
              color: Color(0xff666666),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            controller: widget.controller,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 14), // Aligns text
              border: InputBorder.none,
              suffixIcon: widget.suffixIcon,
              hintText: widget.hintText,
              hintStyle: GoogleFonts.inter(
                color: Color(0xff666666),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

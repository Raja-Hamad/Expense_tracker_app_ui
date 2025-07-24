import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileViewReusableWidget extends StatefulWidget {
  final Icon image;
  final String title;
  const ProfileViewReusableWidget({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  State<ProfileViewReusableWidget> createState() =>
      _ProfileViewReusableWidgetState();
}

class _ProfileViewReusableWidgetState extends State<ProfileViewReusableWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.image,
            const SizedBox(width: 20),
            Text(
              widget.title,
              style: GoogleFonts.inter(
                color: Color(0xff000000),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30,)
      ],
    );
  }
}

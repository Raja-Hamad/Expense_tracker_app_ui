import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledDropdown extends StatelessWidget {
  final String? selectedValue;
  final List<String> items;
  final String hintText;
  final Function(String?) onChanged;

  const StyledDropdown({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffDDDDDD), width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: DropdownButtonFormField<String>(
          value: selectedValue,
          isExpanded: true,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 14),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: GoogleFonts.inter(
              color: Color(0xff666666),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          icon: Icon(Icons.keyboard_arrow_down),
          style: GoogleFonts.inter(
            color: Color(0xff666666),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          items: items.map((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: GoogleFonts.inter()),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

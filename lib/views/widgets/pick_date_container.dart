import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DatePickerField extends StatefulWidget {
  final Icon suffixIcon;
  final void Function(DateTime)? onDateSelected;

  const DatePickerField({
    super.key,
    required this.suffixIcon,
    this.onDateSelected,
  });

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime? selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(picked);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final String displayText = selectedDate != null
        ? DateFormat('E, dd MMM yyyy').format(selectedDate!)
        : 'Select Date';

    return InkWell(
      onTap: () => _pickDate(context),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffDDDDDD), width: 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              displayText,
              style: GoogleFonts.inter(
                color: const Color(0xff666666),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            widget.suffixIcon,
          ],
        ),
      ),
    );
  }
}

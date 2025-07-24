import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/models/expense_or_income_model.dart';
import 'package:mono/utils/app_colors.dart';

// ignore: must_be_immutable
class PaymentSuccessfully extends StatefulWidget {
  ExpenseOrIncomeModel model;
  PaymentSuccessfully({super.key, required this.model});

  @override
  State<PaymentSuccessfully> createState() => _PaymentSuccessfullyState();
}

class _PaymentSuccessfullyState extends State<PaymentSuccessfully> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.18,
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.primaryColor),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    Text(
                      "Bill Payment",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Icon(Icons.more_horiz, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            Center(
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xffFAFAFA),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xff438883),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Center(
                              child: Text(
                                "Payment Successfully",
                                style: GoogleFonts.inter(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff438883),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Center(
                              child: Text(
                                widget.model.name,
                                style: GoogleFonts.inter(
                                  color: Color(0xff666666),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),

                            const SizedBox(height: 42),
                            Text(
                              "Transaction details",
                              style: GoogleFonts.inter(
                                color: Color(0xff000000),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 21),
                            reusableWidget("Payment method", "Debit Card"),
                            reusableWidget("Status", "Completed"),
                            reusableWidget("Time", "06:00 PM"),
                            reusableWidget("Date", widget.model.date),
                            reusableWidget("Transaction Id", "123424-56-7"),
                            reusableWidget("Price", "\$ ${widget.model.amount}"),
                            reusableWidget("Fee", "\$ 0.00"),
                            reusableWidget("Total", "\$ ${widget.model.amount}"),
                          ],
                        ),
                      ),
                    ),
                  Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: (){
            
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: Color(0xff549994), width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 11),
                child: Center(
                  child: Text(
                    "Share Receipt",
                    style: GoogleFonts.inter(
                      color: Color(0xff549994),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget reusableWidget(String title, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                color: Color(0xff666666),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              value,
              style: GoogleFonts.inter(
                color: Color(0xff000000),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/models/expense_or_income_model.dart';
import 'package:mono/utils/app_colors.dart';

class TransactionDetails extends StatefulWidget {
  ExpenseOrIncomeModel model;
  TransactionDetails({super.key, required this.model});

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
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
            height: height * 0.24,
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.primaryColor),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 84),
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
                      "Transactions Details",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Center(
                      child: Text(
                        widget.model.name,
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: Container(
                        height: 25,
                        width: 90,
                
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: widget.model.type == "Income"
                              ? Color(0xffECF3F3)
                              : Color(0xffFEEFEE),
                        ),
                        child: Center(
                          child: Text(
                            widget.model.type,
                            style: GoogleFonts.inter(
                              color: widget.model.type == "Expense"
                                  ? Colors.red
                                  : Color(0xff438883),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        "\$ ${widget.model.amount}",
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Transaction details",
                            style: GoogleFonts.inter(
                              color: Color(0xff000000),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 21),
                          reusableWidget(
                            widget.model.type == "Expense" ? "To" : "From",
                            widget.model.type,
                            widget.model.type=="Income"?Color(0xff438883):Colors.red
                          ),
                
                          reusableWidget("Payment method", "Debit Card",Color(0xff000000)),
                          reusableWidget("Status", "Completed",Color(0xff000000)),
                          reusableWidget("Time", "06:00 PM",Color(0xff000000)),
                          reusableWidget("Date", widget.model.date,Color(0xff000000)),
                          reusableWidget("Transaction Id", "123424-56-7",Color(0xff000000)),
                          reusableWidget("Price", "\$ ${widget.model.amount}",Color(0xff000000)),
                          reusableWidget("Fee", "\$ 0.00",Color(0xff000000)),
                          reusableWidget("Total", "\$ ${widget.model.amount}",Color(0xff000000)),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                    color: Color(0xff549994),
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 11),
                                  child: Center(
                                    child: Text(
                                      "Download Receipt",
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget reusableWidget(String title, String value, Color  textColor) {
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
                color: textColor,
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

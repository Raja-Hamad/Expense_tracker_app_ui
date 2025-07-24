import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/models/expense_or_income_model.dart';
import 'package:mono/utils/app_colors.dart';
import 'package:mono/views/confirm_pay_view.dart';
import 'package:mono/views/widgets/reusable_button.dart';

class PayBillView extends StatefulWidget {
  ExpenseOrIncomeModel model;
  PayBillView({super.key, required this.model});

  @override
  State<PayBillView> createState() => _PayBillViewState();
}

class _PayBillViewState extends State<PayBillView> {
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
                      "Bill Details",
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
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
                      Center(
                        child: Text(
                          widget.model.date,
                          style: GoogleFonts.inter(
                            color: Color(0xff666666),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price",
                            style: GoogleFonts.inter(
                              color: Color(0xff666666),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "\$ ${widget.model.amount}",
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fee",
                            style: GoogleFonts.inter(
                              color: Color(0xff666666),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "\$ 0.00",
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 1,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Color(0xffDDDDDD)),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: GoogleFonts.inter(
                              color: Color(0xff666666),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "\$ ${widget.model.amount}",
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 42),
                      Text(
                        "Select payment method",
                        style: GoogleFonts.inter(
                          color: Color(0xff000000),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      reusableContainerWidget(
                        Colors.transparent,
                        Icon(Icons.wallet, color: Color(0xff888888), size: 34),
                        "Debit Card",
                        "Connect your bank account to deposit & fund",
                      ),
                      const SizedBox(height: 15),
                      reusableContainerWidget(
                        Colors.transparent,
                        Icon(Icons.paypal, color: Color(0xff888888), size: 34),
                        "Paypal",
                        "Connect bank in 5-7 days",
                      ),
                      const SizedBox(height: 30),
                      ReusableButton(title: "Pay Now", onPress: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ConfirmPayView(
                          model: widget.model,
                        )));
                      }),
                      const SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget reusableContainerWidget(
    Color leadingBgColor,
    Icon leadingIcon,
    String title,
    String description,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffECF3F3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: ListTile(
          leading: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: leadingBgColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(child: leadingIcon),
          ),
          title: Text(
            title,
            style: GoogleFonts.inter(
              color: Color(0xff888888),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            description,
            style: GoogleFonts.inter(
              color: Color(0xff888888),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

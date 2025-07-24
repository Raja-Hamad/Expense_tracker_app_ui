import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/models/expense_or_income_model.dart';
import 'package:mono/views/pay_bill_view.dart';

class ConnectWalletAccountsWidget extends StatefulWidget {
  ExpenseOrIncomeModel model;
  ConnectWalletAccountsWidget({super.key, required this.model});

  @override
  State<ConnectWalletAccountsWidget> createState() =>
      _ConnectWalletAccountsWidgetState();
}

class _ConnectWalletAccountsWidgetState
    extends State<ConnectWalletAccountsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        reusableContainerWidget(
          Colors.transparent,
          Icon(Icons.home, color: Color(0xff888888), size: 34),
          "Bank Link",
          "Connect your bank account to deposit & fund",
        ),
        const SizedBox(height: 15),
        reusableContainerWidget(
          Colors.transparent,
          Icon(Icons.currency_exchange, color: Color(0xff888888), size: 34),
          "Microdeposits",
          "Connect bank in 5-7 days",
        ),
        const SizedBox(height: 15),
        reusableContainerWidget(
          Colors.transparent,
          Icon(Icons.paypal, color: Color(0xff888888), size: 34),
          "Paypal",
          "Connect you paypal account",
        ),
        const SizedBox(height: 30),
        Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>  PayBillView(
                model:widget.model
              )));
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
                    "Next",
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
        const SizedBox(height: 30),
      ],
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
        padding: EdgeInsetsGeometry.all(10),
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

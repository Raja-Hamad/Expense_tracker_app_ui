import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/models/expense_or_income_model.dart';
import 'package:mono/utils/app_colors.dart';
import 'package:mono/views/widgets/connect_wallet_accounts_widget.dart';
import 'package:mono/views/widgets/connect_wallet_cards_widget.dart';

class ConnectWallet extends StatefulWidget {
  ExpenseOrIncomeModel model;
   ConnectWallet({super.key,
  required this.model});

  @override
  State<ConnectWallet> createState() => _ConnectWalletState();
}

class _ConnectWalletState extends State<ConnectWallet> {
  bool isCardSelected = true; // Define this in your state

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
                      "Connect Wallet",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Image.asset("assets/images/notification_icon.png"),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          // Toggle Tabs
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xffF4F6F6),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 4,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () =>
                                          setState(() => isCardSelected = true),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: isCardSelected
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Cards",
                                            style: GoogleFonts.inter(
                                              color: Color(0xff666666),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => setState(
                                        () => isCardSelected = false,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: !isCardSelected
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Accounts",
                                            style: GoogleFonts.inter(
                                              color: Color(0xff666666),
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
                          isCardSelected
                              ? ConnectWalletCardsWidget()
                              : ConnectWalletAccountsWidget(
                                model: widget.model,
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
}

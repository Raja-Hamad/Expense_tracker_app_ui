import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/utils/app_colors.dart';
import 'package:mono/views/widgets/transactions_history_wallet.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  bool isTransactionSelected = true; // Define this in your state

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
                      "Wallet",
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
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        "Total Balance",
                        style: GoogleFonts.inter(
                          color: const Color(0xff666666),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "\$24,67.00",
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          resuableOptionsWidget(
                            "Add",
                            Icon(
                              Icons.add,
                              size: 30,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          resuableOptionsWidget(
                            "Pay",
                            Icon(
                              Icons.payment,
                              size: 30,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          resuableOptionsWidget(
                            "Send",
                            Icon(
                              Icons.send,
                              size: 30,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                                      onTap: () => setState(
                                        () => isTransactionSelected = true,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: isTransactionSelected
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Transactions",
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
                                        () => isTransactionSelected = false,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: !isTransactionSelected
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Upcoming bills",
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
                          const SizedBox(height: 10),
                          // Transaction List or Upcoming Bills
                       if (isTransactionSelected)
  SizedBox(
    height: MediaQuery.of(context).size.height * 0.35,
    child: TransactionsHistoryWallet(
      isPaidFilter: true, // Show only paid transactions
    ),
  ),
if (!isTransactionSelected)
  SizedBox(
    height: MediaQuery.of(context).size.height * 0.35,
    child: TransactionsHistoryWallet(
      isPaidFilter: false, // Show only unpaid bills
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

  Widget resuableOptionsWidget(String title, Icon icon) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 1, color: AppColors.primaryColor),
          ),
          child: Center(child: icon),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: GoogleFonts.inter(
            color: Color(0xff222222),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mono/models/expense_or_income_model.dart';
import 'package:mono/views/connect_wallet.dart';
import 'package:mono/views/widgets/loading_shimmer_widget.dart';

class TransactionsHistoryWallet extends StatefulWidget {
  final bool isPaidFilter;
  const TransactionsHistoryWallet({super.key, required this.isPaidFilter});

  @override
  State<TransactionsHistoryWallet> createState() =>
      _TransactionsHistoryWalletState();
}

class _TransactionsHistoryWalletState extends State<TransactionsHistoryWallet>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  List<ExpenseOrIncomeModel> allExpenses = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("expenseOrIncome")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return LoadingShimmerWidget();
              },
            );
          }
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              allExpenses = snapshot.data!.docs
                  .map((doc) => ExpenseOrIncomeModel.fromMap(doc.data()))
                  .where(
                    (expense) =>
                        (expense.isPaid.toLowerCase() ?? "") ==
                        (widget.isPaidFilter == true ? "true" : "false"),
                  )
                  .toList();
            });
          });
          if (allExpenses.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    "assets/json/nothing_found.json",
                    height: 200,
                    width: 200,
                    repeat: true,
                    fit: BoxFit.cover,
                    controller: animationController,
                    onLoaded: (composition) {
                      animationController.duration = composition.duration;
                      animationController.repeat();
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "No matching jobs found.",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: allExpenses.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,

              itemBuilder: (context, index) {
                final expense = allExpenses[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            expense.name,
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            expense.date,
                            style: GoogleFonts.inter(
                              color: Color(0xff666666),
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      widget.isPaidFilter == true
                          ? RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: expense.type == "Income" ? "+" : "-",
                                    style: GoogleFonts.inter(
                                      color: expense.type == "Income"
                                          ? Color(0xff25A969)
                                          : Color(0xffF95B51),
                                    ),
                                  ),
                                  TextSpan(
                                    text: " ${expense.amount}",
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,

                                      color: expense.type == "Income"
                                          ? Color(0xff25A969)
                                          : Color(0xffF95B51),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  ConnectWallet(
                                      model: expense,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 36,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xffECF9F8),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Center(
                                  child: Text(
                                    "Pay",
                                    style: GoogleFonts.inter(
                                      color: Color(0xff438883),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

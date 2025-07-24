import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/utils/app_colors.dart';
import 'package:mono/utils/extensions/local_storage.dart';
import 'package:mono/views/add_expense.dart';
import 'package:mono/views/widgets/transaction_histroy_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String expense = '';
  String income = '';
  LocalStorage localStorage = LocalStorage();
  String? name;
  String? email;
  String? role;
  String? adminDeviceToken;
  String? phone;

  String? imageUrl;
  getValues() async {
    name = await localStorage.getValue("userName");
    email = await localStorage.getValue("email");
    role = await localStorage.getValue("role");
    imageUrl = await localStorage.getValue("imageUrl");
    phone = await localStorage.getValue("phone");
    adminDeviceToken = await localStorage.getValue("userDeviceToken");
    if (kDebugMode) {
      print("Device Token of the admin is ${adminDeviceToken ?? ""}");
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getValues();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(), // Explicitly sets it round

        backgroundColor: Color(0xff438883),
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  "Add",
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Text(
                  "What do you want to add?",
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                actions: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          expense = "Expense";
                          Navigator.pop(context); // dismiss the dialog first

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddExpense(title: expense),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 5,
                            ),
                            child: Center(
                              child: Text(
                                "Expense",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          income = "Income";
                          Navigator.pop(context); // dismiss the dialog first

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddExpense(title: income),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 5,
                            ),
                            child: Center(
                              child: Text(
                                "Income",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
      body: Column(
        children: [
          // Header with stack
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Background header
              Container(
                height: height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(color: AppColors.primaryColor),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: imageUrl != null && imageUrl!.isNotEmpty
                                    ? Image.network(
                                        imageUrl!,
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return Image.asset(
                                                'assets/images/default_avatar.png',
                                                height: 50,
                                                width: 50,
                                                fit: BoxFit.cover,
                                              );
                                            },
                                      )
                                    : Image.asset(
                                        'assets/images/default_avatar.png',
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Good morning",
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    name ?? "",
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Image.asset("assets/images/notification_icon.png"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Overlapping container
              Positioned(
                top: height * 0.3 - 100, // half of 200
                left: 20,
                right: 20,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xff2F7E79),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Total balance section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Balance",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Icon(Icons.more_horiz, color: Colors.white),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "\$24,000",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Income & Expense row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Income
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff4E918D),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_downward,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "Income",
                                  style: GoogleFonts.inter(
                                    color: Color(0xffD0E5E4),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),

                            // Expense
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff4E918D),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_downward,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "Expense",
                                  style: GoogleFonts.inter(
                                    color: Color(0xffD0E5E4),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // Balance amounts
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$24,000",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "\$30,000",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 120), // Add spacing to accommodate overlap
          // Now show the transaction history
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Transaction History",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      "See All",
                      style: GoogleFonts.inter(
                        color: Color(0xff666666),
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16), // spacing
          // ✅ Move Expanded here
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TransactionHistroyWidget(),
            ),
          ),
        ],
      ),
    );
  }
}

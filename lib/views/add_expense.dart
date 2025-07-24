import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mono/controllers/expense/income_controller.dart';
import 'package:mono/models/expense_or_income_model.dart';
import 'package:mono/utils/app_colors.dart';
import 'package:mono/views/widgets/pick_date_container.dart';
import 'package:mono/views/widgets/reusable_button.dart';
import 'package:mono/views/widgets/reusable_text_field.dart';
import 'package:mono/views/widgets/styled_dropdown.dart';
import 'package:uuid/uuid.dart';

class AddExpense extends StatefulWidget {
  final String title;
  const AddExpense({super.key, required this.title});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  String selectedDateString = "";

  IncomeOrExpenseController incomeOrExpenseController = Get.put(
    IncomeOrExpenseController(),
  );

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffFDFDFD),
      body: SizedBox(
        height: height * 1.2, // Adjust this value if needed
        child: Stack(
          children: [
            // Header background
            Container(
              height: height * 0.3,
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
                        "Add ${widget.title}",
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

            // Expense card
            Positioned(
              top: 165,
              left: 20,
              right: 20,
              child: Container(
                height: 600,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "NAME",
                      style: GoogleFonts.inter(
                        color: Color(0xff666666),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ReusableTextField(
                      isPassword: false,
                      controller:
                          incomeOrExpenseController.nameController.value,
                      hintText: "Enter Expense Name",
                      suffixIcon: Icon(
                        Icons.attach_money,
                        color: Color(0xff666666),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "AMOUNT",
                      style: GoogleFonts.inter(
                        color: Color(0xff666666),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ReusableTextField(
                      isPassword: false,
                      controller:
                          incomeOrExpenseController.amountController.value,
                      hintText: "Enter Expense Amount",
                      suffixIcon: Icon(Icons.wallet, color: Color(0xff666666)),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "DATE",
                      style: GoogleFonts.inter(
                        color: Color(0xff666666),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    DatePickerField(
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                      ),
                      onDateSelected: (date) {
                        selectedDateString = DateFormat(
                          'yyyy-MM-dd',
                        ).format(date); // or any format you like
                        if (kDebugMode) {
                          print("Selected date: $selectedDateString");
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "STATUS",
                      style: GoogleFonts.inter(
                        color: Color(0xff666666),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),

                    StyledDropdown(
                      selectedValue:
                          incomeOrExpenseController.isPaid.value.isNotEmpty
                          ? incomeOrExpenseController.isPaid.value
                          : null,
                      items: ['True', 'False'],
                      hintText: 'Is Paid?',
                      onChanged: (value) {
                        incomeOrExpenseController.isPaid.value = value!;
                      },
                    ),

                    const SizedBox(height: 40),
                    ReusableButton(
                      title: "ADD",
                      isLoading: incomeOrExpenseController.isLoading.value,

                      onPress: () {
                        if (kDebugMode) {
                          print("date is $selectedDateString");
                        }
                        ExpenseOrIncomeModel model = ExpenseOrIncomeModel(
                          id: Uuid().v4(),
                          name: incomeOrExpenseController
                              .nameController
                              .value
                              .text
                              .trim()
                              .toString(),
                          amount: incomeOrExpenseController
                              .amountController
                              .value
                              .text,

                          date: selectedDateString,
                          isPaid: incomeOrExpenseController.isPaid.value,
                          type: widget.title.toString(),
                        );
                        incomeOrExpenseController
                            .setIncomeOrExpense(model, context)
                            .then((vallue) {
                              incomeOrExpenseController.amountController.value
                                  .clear();
                              incomeOrExpenseController.nameController.value
                                  .clear();
                              incomeOrExpenseController.isPaid.value = '';
                              selectedDateString = '';
                            });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

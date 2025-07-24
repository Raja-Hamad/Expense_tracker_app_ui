import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mono/models/expense_or_income_model.dart';
import 'package:mono/services/firestore_set_method.dart';
import 'package:mono/utils/extensions/flush_messages.dart';

class IncomeOrExpenseController extends GetxController {
  var isLoading = false.obs;
  final FirestoreSetMethod _firestoreSetMethod = FirestoreSetMethod();
  var nameController = TextEditingController().obs;
  var amountController = TextEditingController().obs;
  RxString isPaid = ''.obs;
  Future<void> setIncomeOrExpense(
    ExpenseOrIncomeModel model,
    BuildContext context,
  ) async {
    try {
      isLoading.value = true;
      await _firestoreSetMethod.setIncomeOrExpense(model, context);
      // ignore: use_build_context_synchronously
      FlushBarMessages.successMessageFlushBar("Added Successfully", context);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      if (kDebugMode) {
        print("Error while uploading: ${e.toString()}");
      }
      // ignore: use_build_context_synchronously
      FlushBarMessages.errorMessageFlushBar("Error while uploading", context);
    }
  }
}

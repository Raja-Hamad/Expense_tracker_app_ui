import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mono/models/expense_or_income_model.dart';
import 'package:mono/utils/extensions/flush_messages.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class FirestoreSetMethod {
  Future<void> setIncomeOrExpense(
    ExpenseOrIncomeModel model,
    BuildContext context,
  ) async {
    try {
      await _firebaseFirestore
          .collection("expenseOrIncome")
          .doc(model.id)
          .set(model.toMap());
      // ignore: use_build_context_synchronously
      FlushBarMessages.successMessageFlushBar("Added Successfully", context);
    } catch (e) {
      if (kDebugMode) {
        print("Error while uploading: ${e.toString()}");
      }
      // ignore: use_build_context_synchronously
      FlushBarMessages.errorMessageFlushBar("Error while uploading", context);
    }
  }
   Future<String> uploadImageToCloudinary(
    File imageFile,
    BuildContext context,
  ) async {
    final cloudName = 'dqs1y6urv'; // Replace with your Cloudinary Cloud Name
    final apiKey = '463369248646777'; // Replace with your Cloudinary API Key
    final preset =
        'ecommerce_preset'; // Replace with your Cloudinary Upload Preset

    final url = Uri.parse(
      'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
    );
    final request =
        http.MultipartRequest('POST', url)
          ..fields['upload_preset'] = preset
          ..files.add(
            await http.MultipartFile.fromPath('file', imageFile.path),
          );

    final response = await request.send();
    if (response.statusCode == 200) {
      FlushBarMessages.successMessageFlushBar(
        "Image Uploaded Successfully",
        // ignore: use_build_context_synchronously
        context,
      );
      final res = await http.Response.fromStream(response);
      final data = jsonDecode(res.body);
      return data['secure_url']; // Image URL from Cloudinary
    } else {
      // ignore: use_build_context_synchronously
      FlushBarMessages.errorMessageFlushBar("Failed to upload Image", context);
      throw Exception('Failed to upload image to Cloudinary');
    }
  }
}

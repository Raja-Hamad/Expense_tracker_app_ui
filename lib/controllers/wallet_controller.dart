import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WalletController extends GetxController{
  var cardNameController=TextEditingController().obs;
  var cardNumberController=TextEditingController().obs;
  var cardCVCController=TextEditingController().obs;
  var cardZipController=TextEditingController().obs;
  var cardExpController=TextEditingController().obs;
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/controllers/wallet_controller.dart';
import 'package:mono/views/widgets/reusable_text_field.dart';

class ConnectWalletCardsWidget extends StatefulWidget {
  const ConnectWalletCardsWidget({super.key});

  @override
  State<ConnectWalletCardsWidget> createState() =>
      _ConnectWalletCardsWidgetState();
}

class _ConnectWalletCardsWidgetState extends State<ConnectWalletCardsWidget> {
  final WalletController _walletController = Get.put(WalletController());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 26),
        SizedBox(
          width: double.infinity,
          height: 225, // enough height to show both layers
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // Background card
              Positioned(
                top: 0,
                child: Container(
                  height: 185,
                  width: 284,
                  decoration: BoxDecoration(
                    color: const Color(0xff3FC6AB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              // Foreground image centered with top padding
              Positioned(
                top: 16,
                child: Image.asset(
                  "assets/images/cards.png",
                  height: 209,
                  width: 324,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Text(
          "Add your debit Card",
          style: GoogleFonts.inter(
            color: const Color(0xff000000),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "This card must be connected to a bank account under your name",
          style: GoogleFonts.inter(
            color: Color(0xff666666),
            fontSize: 13,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 30),
        ReusableTextField(
          controller: _walletController.cardNameController.value,
          hintText: "NAME ON CARD",
          suffixIcon: Icon(Icons.person),
          isPassword: false,
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: ReusableTextField(
                controller: _walletController.cardNumberController.value,
                hintText: "DEBIT CARD NUMBER",
                suffixIcon: Icon(Icons.wallet),
                isPassword: false,
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              flex: 2,
              child: ReusableTextField(
                controller: _walletController.cardCVCController.value,
                hintText: "CVC",
                suffixIcon: Icon(Icons.lock_outline),
                isPassword: false,
              ),
            ),
          ],
        ),
          const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: ReusableTextField(
                controller: _walletController.cardExpController.value,
                hintText: "EXPIRATION MM/YY",
                suffixIcon: Icon(Icons.calendar_month),
                isPassword: false,
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              flex: 2,
              child: ReusableTextField(
                controller: _walletController.cardZipController.value,
                hintText: "ZIP",
                suffixIcon: Icon(Icons.folder_zip),
                isPassword: false,
              ),
            ),
          ],
        ),
        const SizedBox(height: 22,),
      ],
    );
  }
}

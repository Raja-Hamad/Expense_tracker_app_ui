import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/controllers/signup_controller.dart';
import 'package:mono/utils/app_colors.dart';
import 'package:mono/views/authentication/signin_view.dart';
import 'package:mono/views/widgets/reusable_button.dart';
import 'package:mono/views/widgets/reusable_text_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: SingleChildScrollView(
        child: Column(
          children: [
              Container(
                height: MediaQuery.of(context).size.height*0.24,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor
                ),
                child: Padding(padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 15,
                  vertical: 50
                ),
                child:   Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome👋",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10,),
                       Text(
                      "SignUp",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),),
              ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              
                  const SizedBox(height: 24),
                  // Profile Image Picker
                  Center(
                    child: Obx(() {
                      return InkWell(
                        onTap: signupController.pickImageFromGallery,
                        child: signupController.selectedImage.value == null
                            ? CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 40,
                                child: const Icon(Icons.camera_alt),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  40,
                                ), // Make it circular
                                child: Image.file(
                                  signupController.selectedImage.value!,
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      );
                    }),
                  ),
                        
                  const SizedBox(height: 16),
                  ReusableTextField(
                    suffixIcon: Icon(Icons.person, color: Color(0xff666666)),
                    hintText: "Full Name",
                    controller: signupController.nameController.value,
                    isPassword: false,
                  ),
                  const SizedBox(height: 16),
                  ReusableTextField(
                    suffixIcon: Icon(Icons.email, color: Color(0xff666666)),
                    hintText: "Email Address",
                    controller: signupController.emailController.value,
                    isPassword: false,
                  ),
                  const SizedBox(height: 16),
                  ReusableTextField(
                    suffixIcon: Icon(Icons.password, color: Color(0xff666666)),
                    hintText: "Password",
                    controller: signupController.passwordController.value,
                    isPassword: true,
                  ),
                  const SizedBox(height: 16),
                  ReusableTextField(
                    suffixIcon: Icon(Icons.location_city, color: Color(0xff666666)),
                    hintText: "Address",
                    controller: signupController.addressController.value,
                    isPassword: false,
                  ),
                  const SizedBox(height: 16),
                  ReusableTextField(
                    suffixIcon: Icon(Icons.phone, color: Color(0xff666666)),
                    hintText: "Contact Number",
                    controller: signupController.phoneController.value,
                    isPassword: false,
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.white),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: signupController.selectedGender.value.isNotEmpty
                            ? signupController.selectedGender.value
                            : null,
                        decoration: InputDecoration(
                          labelText: "Gender",
                          labelStyle: GoogleFonts.poppins(color: Color(0xFF757575)),
                          border: InputBorder.none,
                        ),
                        items: ["Male", "Female", "Other"].map((gender) {
                          return DropdownMenuItem(
                            value: gender,
                            child: Text(gender, style: GoogleFonts.poppins()),
                          );
                        }).toList(),
                        onChanged: (value) {
                          signupController.selectedGender.value = value!;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => GestureDetector(
                      onTap: () => signupController.pickDate(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Color(0xFFE0E0E0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              signupController.selectedDob.value.isEmpty
                                  ? "Select Date of Birth"
                                  : signupController.selectedDob.value,
                              style: GoogleFonts.poppins(
                                color: signupController.selectedDob.value.isEmpty
                                    ? Color(0xFF757575)
                                    : AppColors.primaryColor,
                              ),
                            ),
                            const Icon(
                              Icons.calendar_today,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                        
                  const SizedBox(height: 32),
                  Obx(() {
                    return ReusableButton(
                      isLoading: signupController.isLoading.value,
                      title: "Register",
                      onPress: () {
                        signupController.registerAdmin(
                          image: signupController.selectedImage.value != null
                              ? File(signupController.selectedImage.value!.path)
                              : null,
                          address: signupController.addressController.value.text
                              .trim()
                              .toString(),
                          phone: signupController.phoneController.value.text
                              .trim()
                              .toString(),
                          gender: signupController.selectedGender.value,
                          dob: signupController.selectedDob.value,
                          name: signupController.nameController.value.text
                              .trim()
                              .toString(),
                          email: signupController.emailController.value.text
                              .trim()
                              .toString(),
                          password: signupController.passwordController.value.text
                              .trim()
                              .toString(),
                          context: context,
                        );
                      },
                    );
                  }),
                  const SizedBox(height: 16),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SigninView()),
                        );
                      },
                      child: Text(
                        "Already have an account? Login",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Color(0xFF757575),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

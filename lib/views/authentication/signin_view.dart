
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/controllers/signin_controller.dart';
import 'package:mono/utils/app_colors.dart';
import 'package:mono/views/authentication/signup_view.dart';
import 'package:mono/views/widgets/reusable_button.dart';
import 'package:mono/views/widgets/reusable_text_field.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
 
  LoginController loginController = Get.put(LoginController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // ForgetPasswordController forgetPasswordController = Get.put(
  //   ForgetPasswordController(),
  // );

   void disposeValues(){
    emailController.clear();
    passwordController.clear();
  }
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
                        "Welcome Back👋",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                         Text(
                        "SignIn",
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back 👋",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ReusableTextField(
                    suffixIcon:Icon(Icons.email,color: Color(0xff666666),),
                      controller: emailController,
                      isPassword: false,
                      hintText: "Email Address",
                    ),
                    const SizedBox(height: 16),
                    ReusableTextField(
                      suffixIcon: Icon(Icons.password,color: Color(0xff666666),),
                      controller: passwordController,
                      isPassword: true,
                      hintText: "Password",
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          // showModalBottomSheet(
                          //   context: context,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.vertical(
                          //       top: Radius.circular(20),
                          //     ),
                          //   ),
                          //   isScrollControlled: true,
                          //   backgroundColor: AppColors.white,
                          //   builder:
                          //       (_) => CustomBottomSheet(
                          //         controller:
                          //             forgetPasswordController.emailController.value,
                          //         title: "Forget Password",
                          //         buttonText: "Reset Password",
                          //         onSubmit: () {
                          //           forgetPasswordController.resetPassword(context);
                          //           // Call your reset method here
                          //         },
                          //       ),
                          // );
                        },
                
                        child: Text(
                          "Forget Password?",
                          style: GoogleFonts.poppins(color: AppColors.primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Obx(() {
                      return ReusableButton(
                        isLoading: loginController.isLoading.value,
                        title: "Login",
                        onPress: () {
                            FocusScope.of(context).unfocus();
            
                          loginController.loginAdmin(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            context: context,
                          ).then((value){
                            disposeValues();
                          }).onError((error,stackTrace){
                            if(kDebugMode){
                              print("Error is $error");
                            }
                          });
                        },
                      );
                    }),
                    const SizedBox(height: 30,),
                    Center(
                      child: Text("OR",style: GoogleFonts.poppins(color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
                    ),
                    const SizedBox(height: 30,),
                    Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Color(0xFFE0E0E0)
                      )
                    ),
                    child: Padding(padding: EdgeInsets.symmetric(
                      vertical: 10
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      
                        children: [
                          Text("Sign In with Google",
                          style: GoogleFonts.poppins(color: Colors.black,
                          fontSize: 16),),
                          const SizedBox(width: 10,),
                          Image.asset("assets/images/google_logo.jpeg",
                          height: 20,
                          width: 20,
                          fit: BoxFit.cover,)
                        ],
                      ),
                    ),),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Navigate to Register Screen
                        },
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupView()));
                          },
                          child: Text(
                            "Don't have an account? Register",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Color(0xFF757575),
                            ),
                          ),
                        ),
                      ),
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

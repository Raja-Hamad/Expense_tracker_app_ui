import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/utils/app_colors.dart';
import 'package:mono/utils/extensions/local_storage.dart';
import 'package:mono/views/widgets/profile_view_reusable_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none, // allows overflow
              children: [
                // Main profile container
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
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Profile",
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
        
                // Circular container half overlapping
                Positioned(
                  bottom: -60, // half of 120 to overlap equally
                  left: (width / 2) - 60, // center horizontally
                  child: ClipOval(
                    child: imageUrl != null && imageUrl!.isNotEmpty
                        ? Image.network(
                            imageUrl!,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/default_avatar.png',
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              );
                            },
                          )
                        : Image.asset(
                            'assets/images/default_avatar.png',
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ],
            ),
        
            const SizedBox(height: 80), // add spacing for the overlap
            // rest of the content
            Text(
              name ?? "",
              style: GoogleFonts.inter(
                color: Color(0xff222222),
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            Text(
              email ?? "",
              style: GoogleFonts.inter(
                color: Color(0xff43837F),
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileViewReusableWidget(
                    image: Icon(Icons.child_friendly),
                    title: "Invite Friends",
                  ),
                    ProfileViewReusableWidget(
                    image: Icon(Icons.info),
                    title: "Account Info",
                  ),
                    ProfileViewReusableWidget(
                    image: Icon(Icons.person),
                    title: "Personal Profile",
                  ),
                    ProfileViewReusableWidget(
                    image: Icon(Icons.mail),
                    title: "Message Center",
                  ),
                    ProfileViewReusableWidget(
                    image:Icon(Icons.security),
                    title: "Login and Security",
                  ),
                    ProfileViewReusableWidget(
                    image:Icon(Icons.privacy_tip),
                    title: "Data and Privacy",
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

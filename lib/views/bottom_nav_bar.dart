import 'package:flutter/material.dart';
import 'package:mono/views/home_view.dart';
import 'package:mono/views/profile_view.dart';
import 'package:mono/views/statistics_view.dart';
import 'package:mono/views/wallet_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> allScreens = [
    const HomeView(),
    // const StatisticsView(),
    const WalletView(),
    const ProfileView(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: allScreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xff4C928D),
        unselectedItemColor: const Color(0xffA8A8A8),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
  iconSize: 35, // 👈 Increase icon size here
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.bar_chart),
          //   label: '',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}

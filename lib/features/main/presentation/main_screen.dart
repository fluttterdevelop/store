import 'package:flutter/material.dart';
import 'package:store/features/profile/presentation/profile_screen.dart';

import '../../home/presentation/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var currentIndex = 0;
  var pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          SizedBox(),
          ProductScreen(),
          SizedBox(),
          SizedBox(),
         ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          currentIndex = index;
          setState(() {
            pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut);
          });
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.black,
        fixedColor: Colors.orange,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
          label: 'Home',),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Products',),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Cart',),
          BottomNavigationBarItem(
            icon: Icon(Icons.saved_search),
            label: 'Saved',),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',),
        ],
      ),
    );
  }
}

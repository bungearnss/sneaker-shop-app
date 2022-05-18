import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import '../constant.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/homepage/home_screen.dart';
import '../screens/profile/profile_screen.dart';

class BottomTabNavigator extends StatefulWidget {
  const BottomTabNavigator({Key? key}) : super(key: key);

  @override
  State<BottomTabNavigator> createState() => _BottomTabNavigatorState();
}

class _BottomTabNavigatorState extends State<BottomTabNavigator> {
  PageController _pageController = PageController();

  int _selectedIndex = 0;
  final List<Widget> _screen = [
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 30.0,
        selectedColor: materialButtonColor,
        strokeColor: materialButtonColor,
        unSelectedColor: const Color(0xffacacac),
        backgroundColor: Colors.white,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart_checkout_outlined),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.person_outline_outlined),
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider_task/utils/color_constant/color_constant.dart';
import 'package:provider_task/view/cart_screen/cart_screen.dart';
import 'package:provider_task/view/itemlist_screen/item_list_screen.dart';
import 'package:provider_task/view/saved/saved.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  List pages = [
    ItemListScreen(),
    Saved(),
    Cart(),
    Center(child: Text('Settings'),),
  ];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorConstant.backgroundColor,
          selectedItemColor: ColorConstant.primaryTextColor,
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Saved'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'Settings')
          ]),
    );
  }
}

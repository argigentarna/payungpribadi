// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:payungpribadi/common/const.dart';
import 'package:payungpribadi/data/models/item_menu.dart';
import 'package:payungpribadi/presentation/screen/home_screen.dart';
import 'package:payungpribadi/presentation/screen/notification_screen.dart';
import 'package:payungpribadi/presentation/screen/saerch_screen.dart';

class MenuNotifier extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      notifyListeners();
    }
  }

  List<ItemMenu> _items = [
    ItemMenu(svgPath: svgHome, label: 'Home', isMainMenu: true),
    ItemMenu(svgPath: svgSearch, label: 'Cari', isMainMenu: true),
    ItemMenu(svgPath: svgNotifications, label: 'Notifications'),
    ItemMenu(svgPath: svgCart, label: 'Cart'),
    ItemMenu(svgPath: svgCoupon, label: 'Coupon'),
    ItemMenu(svgPath: svgMap, label: 'Address'),
    ItemMenu(svgPath: svgTransactions, label: 'Transactions'),
    ItemMenu(svgPath: svgFriends, label: 'Friends'),
    // Add more items with SVG paths as needed
  ];

  List<ItemMenu> get items => _items;

  void selectIndex(BuildContext context, int index) {
    if (items[index].isMainMenu == true) {
      _selectedIndex = index;
      notifyListeners();
    } else {
      Navigator.pushNamed(context, '/under_construction_screen');
    }
  }

  Widget get mainContent {
    switch (_selectedIndex) {
      case 1:
        return const SearchScreen();
      case 2:
        return const NotificationScreen();
      // Add more cases as needed
      default:
        return const HomeScreen();
    }
  }
}

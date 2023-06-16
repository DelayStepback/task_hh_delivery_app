import 'package:flutter/material.dart';
import 'package:task_hh_delivery_app/pages/account_page.dart';
import 'package:task_hh_delivery_app/pages/cart_page.dart';
import 'package:task_hh_delivery_app/pages/general_page.dart';
import 'package:task_hh_delivery_app/pages/search_page.dart';
import 'package:task_hh_delivery_app/pages/signle_category_page.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({super.key, required this.index, nameTitle});
  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const GeneralPage(),
      const SearchPage(),
      const CartPage(),
      const AccountPage(),
    ];
    return myList[index];
  }
}

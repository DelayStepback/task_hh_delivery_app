import 'package:flutter/material.dart';

class BNavigator extends StatefulWidget {
  final Function currentIndex;
  const BNavigator({super.key, required this.currentIndex});

  @override
  State<BNavigator> createState() => _BNavigatorState();
}

class _BNavigatorState extends State<BNavigator> {
  int index = 0;


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: Color.fromRGBO(51, 100, 224, 1),
        unselectedItemColor: Color.fromRGBO(165, 169, 178, 1),
        elevation: 0,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Главная',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Поиск',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Home',
          ),
        ]
    );
  }
}

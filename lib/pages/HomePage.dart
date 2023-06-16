import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_hh_delivery_app/pages/account_page.dart';
import 'package:task_hh_delivery_app/pages/cart_page.dart';
import 'package:task_hh_delivery_app/pages/general_page.dart';
import 'package:task_hh_delivery_app/pages/search_page.dart';
import 'package:task_hh_delivery_app/pages/signle_category_page.dart';

import '../components/category_item_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
    int _currentTabIndex = 0;
  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return
      Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: BottomNavigationBar(
          selectedItemColor: Color.fromRGBO(51, 100, 224, 1),
          unselectedItemColor: Color.fromRGBO(165, 169, 178, 1),
          elevation: 0,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Поиск',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Account',
            ),
          ],
        onTap: _onTap,
        currentIndex: _currentTabIndex,
    ),
      );
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState?.pushReplacementNamed("Home");
        break;
      case 1:
        _navigatorKey.currentState?.pushReplacementNamed("Search");
        break;
      case 2:
        _navigatorKey.currentState?.pushReplacementNamed("Cart");
        break;
      case 3:
        _navigatorKey.currentState?.pushReplacementNamed("Account");
        break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case "Search":
        return MaterialPageRoute(builder: (context) => SearchPage());
      case "Cart":
        return MaterialPageRoute(builder: (context) => CartPage());
      case "Account":
        return MaterialPageRoute(builder: (context) => AccountPage());
      case "Categories":
        final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(builder: (context) => SingleCategoryPage(nameTitle: args.nameTitle));
      default:
        return MaterialPageRoute(builder: (context) => GeneralPage());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_hh_delivery_app/pages/HomePage.dart';
import 'package:task_hh_delivery_app/pages/general_page.dart';
import 'dart:io';

import 'models/cart_model.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => CartModel())],
    child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
    )
    );
  }
}


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_hh_delivery_app/models/categories_model.dart';
import 'package:task_hh_delivery_app/pages/general_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryModel(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: GeneralPage(),
      ),
    );
  }
}


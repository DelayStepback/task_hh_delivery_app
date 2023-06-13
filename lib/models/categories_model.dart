
import 'dart:convert';

import 'package:flutter/material.dart';

class dddddategoriesModel extends ChangeNotifier {
  // list of item on shop

  final List _categoryItems = [
    // [ itemName, itemPrice, itemPath, color ]
    ['Бургер', "120.00", 'lib/icons/burger.png', Colors.green],
    ['Паста', "340.00", 'lib/icons/pasta.png', Colors.redAccent],
    ['Пицца', "210.00", 'lib/icons/pizza.png', Colors.yellow],
    ['Тако', "175.00", 'lib/icons/taco.png', Colors.orange],
  ];

  get shopItems => _categoryItems;

  }
}

class Category extends ChangeNotifier {
  String name;
  int id;
  String image_url;

  Category(this.name, this.id, this.image_url);

  factory Category.fromJson(dynamic json) {
    return Category(json['name'] as String, json['id'] as int, json['image_url'] as String);
  }
}

class CategoryModel extends ChangeNotifier {
  String arrayObjsText =
      '{"categories": [{"name": "dart", "quantity": 12}, {"name": "flutter", "quantity": 25}, {"name": "json", "quantity": 8}]}';

  var categoryObjsJson = jsonDecode('https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54')['сategories'] as List;
  List<Category> categoryObjs = categoryObjsJson.map((cateogryJson) => Category.fromJson(cateogryJson)).toList();

  print(tagObjs);
}
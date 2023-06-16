
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Dishes {
  int id;
  String name;
  int price;
  int weight;
  String description;
  String imageUrl;
  List<String> tegs;

  Dishes(this.id,
        this.name,
        this.price,
        this.weight,
        this.description,
        this.imageUrl,
        this.tegs
      );

  factory Dishes.fromJson(Map<String, dynamic> json) {
    return Dishes(
      json['id'] as int, json['name'] as String,
      json['price'] as int, json['weight'] as int,
      json['description'] as String, json['image_url'] as String,
      json['tegs'].cast<String>()
    );
  }

}

// вернет лист с Dish объектами
Future<List<Dishes>> fetchData_dishes() async {
  var url = Uri.parse('https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b');

  final response = await http.get(url);


  if (response.statusCode == 200) {
    List jsonResponse = jsonDecode(response.body)["dishes"];
    return jsonResponse.map<Dishes>((json) => Dishes.fromJson(json)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}


// ?? ChangeNotifier
class CartModel extends ChangeNotifier {
  // list of item on shop
  List<Dishes> _shopItems = [];


  get shopItems => _shopItems;

  List _cartItems = [];

  get cartItems => _cartItems;

  // add items to cart;
  void addItemToCart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove items
  void removeItemFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }

  int indexLastWhere(String name){
    for (int i = _cartItems.length-1; i > -1; i--) {
      if (_cartItems[i][1] == name){
        return i;
      }
    }
    return -1;
    return _cartItems.lastWhere((namez) => namez == name);
  }

  // calculate total price
  String calculateTotalPrice(){
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i][2]);
    }
    return totalPrice.toStringAsFixed(2);
  }


  String countOfItemName(String name){
    int count = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      if (_cartItems[i][1] == name) {
        count++;
      }
    }
    return count.toString();
  }
}

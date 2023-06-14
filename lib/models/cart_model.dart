
import 'package:flutter/material.dart';

// class DishesModel {
//   late final List<Dishes> dishes;
//
//   DishesModel({this.dishes});
//
//   DishesModel.fromJson(Map<String, dynamic> json) {
//     if (json['dishes'] != null) {
//       dishes = new List<Dishes>();
//       json['dishes'].forEach((v) {
//         dishes.add(new Dishes.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.dishes != null) {
//       data['dishes'] = this.dishes.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Dishes {
//   int id;
//   String name;
//   int price;
//   int weight;
//   String description;
//   String imageUrl;
//   List<String> tegs;
//
//   Dishes(
//       {this.id,
//         this.name,
//         this.price,
//         this.weight,
//         this.description,
//         this.imageUrl,
//         this.tegs});
//
//   Dishes.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     price = json['price'];
//     weight = json['weight'];
//     description = json['description'];
//     imageUrl = json['image_url'];
//     tegs = json['tegs'].cast<String>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['price'] = this.price;
//     data['weight'] = this.weight;
//     data['description'] = this.description;
//     data['image_url'] = this.imageUrl;
//     data['tegs'] = this.tegs;
//     return data;
//   }
// }



class CartModel extends ChangeNotifier {
  // list of item on shop

  final List _shopItems = [
    // [ itemName, itemPrice, itemPath, color ]
    ['Бургер', "120.00", 'lib/icons/burger.png', Colors.green],
    ['Паста', "340.00", 'lib/icons/pasta.png', Colors.redAccent],
    ['Пицца', "210.00", 'lib/icons/pizza.png', Colors.yellow],
    ['Тако', "175.00", 'lib/icons/taco.png', Colors.orange],
  ];

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
      if (_cartItems[i][0] == name){
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
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }


  String countOfItemName(String name){
    int count = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      if (_cartItems[i][0] == name) {
        count++;
      }
    }

    return count.toString();
  }
}

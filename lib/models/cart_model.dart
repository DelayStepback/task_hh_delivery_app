import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Dishes extends ChangeNotifier {
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

// json parse
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


Future<List<String>> fetchTegs() async {
  List<Dishes> dishes = await fetchData_dishes();
  print(dishes[0].tegs);
  List<String> unqTegs = [];
  for (Dishes dish in dishes){
    for (String teg in dish.tegs){
      if (unqTegs.indexOf(teg) == -1){
        unqTegs.add(teg);
      }
    }
  }
  return unqTegs;
}





class CartModel extends ChangeNotifier {

  List<Dishes> _cartItems = [];
  List<Dishes> get cartItems => _cartItems;



  var map_of_Dishes = Map();

  // add items to cart;
  void addItemToCart(Dishes dish){

    // если уже есть в корзине
    if (checkDishInDishes(dish, _cartItems)){
      map_of_Dishes[dish.id] += 1;
    }
    // иначе добавляем
    else{
      _cartItems.add(dish);
      map_of_Dishes[dish.id] = 1;
    }
    notifyListeners();
  }

  bool checkDishInDishes(Dishes dish, List<Dishes> cartDishes){
    for (var item in cartDishes){
      if (eqTwoDishes(dish, item)){
        return true;
      }
    }
    return false;
  }
  bool eqTwoDishes(Dishes dish1, Dishes dish2){
    return dish1.id == dish2.id;
  }

  Dishes findDish_byID(int id){
    for (var item in _cartItems){
      if (item.id == id){
        return item;
      }
    }
    throw Exception('Unexpected error occured!');
  }
  String calculateTotalPrice(){
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++){
      // count of item: map_of_Dishes[_cartItems[i].id]
      totalPrice += _cartItems[i].price * map_of_Dishes[_cartItems[i].id];
    }
    notifyListeners();
    return totalPrice.toStringAsFixed(2);

  }

  void removeOneFromCart(int id){
    if (map_of_Dishes[id] > 1){
      map_of_Dishes[id] -= 1;
    }
    else{
      map_of_Dishes.remove(id);
      for (int i = 0; i < _cartItems.length; i++){
        if (_cartItems[i].id == id){
          _cartItems.removeAt(i);
          notifyListeners();
          return;
        }
      }
    }
    notifyListeners();

  }


}

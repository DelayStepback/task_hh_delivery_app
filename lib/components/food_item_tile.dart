import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';

class FoodItemTile extends StatelessWidget {

  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;
  final String count;


  FoodItemTile({
    super.key,
    required this.color,
  required this.imagePath,
  required this.itemName,
  required this.itemPrice,
    required this.onPressed,
    required this.count,
  });



  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(color: color[100],
          borderRadius: BorderRadius.circular(24)),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // image
            Image.asset(imagePath, height: 100,),

            // text
            Text(itemName, style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),),

            // button
            MaterialButton(onPressed: onPressed,
              color: color,

            child: Column(
              children: [
                Text(itemPrice + ' ' + '\₽', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),),

              ],
            ),
            ),


    Consumer<CartModel>(
    builder: (context2, value, child) {
      return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () => value.removeItemFromCart(value.indexLastWhere(itemName)), icon: Icon(Icons.remove)),
                Text(count, style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),),
                IconButton(onPressed: onPressed, icon: Icon(Icons.add)),
              ],
            );
    })
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Consumer<CartModel>(
            builder: (context, value, child) {
              return Text('Total : ${value.cartItems[0].name}');


              // return Expanded(
              //     child: ListView.builder(
              //         itemCount: value.cartItems.length,
              //         itemBuilder: (context, index) {
              //           return Padding(
              //             padding: const EdgeInsets.all(12.0),
              //             child: Container(
              //               decoration: BoxDecoration(
              //                   color: Colors.blueGrey[400],
              //                   borderRadius: BorderRadius.circular(14)),
              //               child: ListTile(
              //                   leading: Image.network(
              //                     value.cartItems[index].imageUrl,
              //                     height: 40,
              //                   ),
              //                   title: Text(
              //                     value.cartItems[index].name,
              //                     style: TextStyle(
              //                         color: Colors.white,
              //                         fontWeight: FontWeight.bold),
              //                   ),
              //                   subtitle: Text(value.cartItems[index].price.toString() + ' \₽',
              //                   ),
              //                   trailing: IconButton(
              //                     icon: Icon(Icons.cancel),
              //                     onPressed: () => null, //=> Provider.of<CartModel>(context, listen: false).removeItemFromCart(index),
              //                   )
              //               ),
              //             ),
              //           );
              //         })
              // );
            },
          )),
    );
  }
}



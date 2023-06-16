import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            leadingWidth: MediaQuery.of(context).size.width,
            toolbarHeight: 60,
            elevation: 0,
            leading: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.location_on_outlined),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Волгоград',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '14 июня 2023',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 50),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 100,
                  height: 1,
                ),
                Icon(Icons.person)
              ],
            ),
          ),
          body: Consumer<CartModel>(
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ListView.builder(

                          itemCount: value.map_of_Dishes.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(248, 247, 245, 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Image.network(
                                      value.cartItems[index].imageUrl,
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          textAlign: TextAlign.start,
                                          value.cartItems[index].name,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            value.cartItems[index].price
                                                    .toString() +
                                                ' \₽',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            ' · ' +
                                                value.cartItems[index].weight
                                                    .toString() +
                                                'г',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                // buttons
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(239, 238, 236, 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),

                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () =>
                                              Provider.of<CartModel>(context,
                                                  listen: false)
                                                  .removeOneFromCart(value
                                                  .cartItems[index].id),
                                          icon: Icon(Icons.remove)),
                                      Text(value.map_of_Dishes[
                                      value.cartItems[index].id]
                                          .toString()),
                                      IconButton(
                                          onPressed: () =>
                                              Provider.of<CartModel>(context,
                                                  listen: false)
                                                  .addItemToCart(value
                                                  .cartItems[index]),
                                          icon: Icon(Icons.add))
                                    ],
                                  ),
                                )
                              ],
                            );
                          }),
                    ),
                    MaterialButton(
                        minWidth: MediaQuery.of(context).size.width - 20,
                        height: 48,
                        color: Color.fromRGBO(51, 100, 224, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {},
                        child: Text(
                          'Оплатить ' + value.calculateTotalPrice() + '\₽',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ))
                  ],
                ),
              );

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

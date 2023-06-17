import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  String getDateNow(){
    final now = DateTime.now();
//    var str = DateFormat('yMd').format(now);
    String mount_txt = '';
    switch(now.month){
      case 1: mount_txt = "Января"; break;
      case 2: mount_txt = "Февраля"; break;
      case 3: mount_txt = "Марта"; break;
      case 4: mount_txt = "Апреля"; break;
      case 5: mount_txt = "Мая"; break;
      case 6: mount_txt = "Июня"; break;
      case 7: mount_txt = "Июля"; break;
      case 8: mount_txt = "Августа"; break;
      case 9: mount_txt = "Сентября"; break;
      case 10: mount_txt = "Октября"; break;
      case 11: mount_txt = "Ноября"; break;
      case 12: mount_txt = "Декабря"; break;
    }
    String str = "${now.day.toString()} ${mount_txt}, ${now.year.toString()} ";
    return str;
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
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SvgPicture.asset(
                        'lib/assets/icons/Location.svg',
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Волгоград',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          getDateNow(),
                          style: const TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 100,
                  height: 1,
                ),
                const CircleAvatar(
                  radius: 22, // Image radius
                  backgroundImage:
                      NetworkImage('https://b1.filmpro.ru/c/150799.700xp.jpg'),
                )
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(248, 247, 245, 1),
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
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            value.cartItems[index].name,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                value.cartItems[index].price
                                                        .toString() +
                                                    ' \₽',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14),
                                              ),
                                              Text(
                                                ' · ' +
                                                    value
                                                        .cartItems[index].weight
                                                        .toString() +
                                                    'г',
                                                style: const TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.4),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      //Expanded(child: SizedBox(width: 30,)),
                                      // buttons
                                      Container(
                                        decoration: BoxDecoration(
                                          color:
                                              const Color.fromRGBO(239, 238, 236, 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            IconButton(
                                                onPressed: () =>
                                                    Provider.of<CartModel>(
                                                            context,
                                                            listen: false)
                                                        .removeOneFromCart(value
                                                            .cartItems[index]
                                                            .id),
                                                icon: const Icon(Icons.remove)),
                                            Text(value.map_of_Dishes[
                                                    value.cartItems[index].id]
                                                .toString()),
                                            IconButton(
                                                onPressed: () => Provider.of<
                                                            CartModel>(context,
                                                        listen: false)
                                                    .addItemToCart(
                                                        value.cartItems[index]),
                                                icon: const Icon(Icons.add))
                                          ],
                                        ),
                                      ),
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
                        color: const Color.fromRGBO(51, 100, 224, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {},
                        child: Text(
                          'Оплатить ' + value.calculateTotalPrice() + '\₽',
                          style: const TextStyle(color: Colors.white, fontSize: 18.0),
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

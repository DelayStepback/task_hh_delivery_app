import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';

class FoodItemTile extends StatelessWidget {

  final int id;
  final String itemName;
  final int price;
  final int weight;
  final String description;
  final String imagePath;
  final List<String> tegs;

  const FoodItemTile({
    super.key,
 required this.id, required this.itemName, required this.imagePath, required this.tegs, required this.price, required this.weight, required this.description,
  });

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)), //this right here
          child: Container(
            height: MediaQuery.of(context).size.height / 1.8,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(248, 247, 245, 1),
                                  image: DecorationImage(
                                    image: NetworkImage(imagePath),
                                    scale: 3,
                                  ))

                          ),
                          Positioned(
                            right: 8,
                            top: 8,
                            child: Row(
                              children: [
                                Material(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: IconButton(
                                    icon: const Icon(Icons.favorite_border,
                                        color: Colors.black),
                                    color: Colors.white,
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Material(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: IconButton(
                                    icon: const Icon(Icons.close,
                                        color: Colors.black),
                                    color: Colors.white,
                                    onPressed: () => Navigator.of(context).pop(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(itemName, style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: 'SFProDisplay',
                            ),),
                          )),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text(price.toString() + '\₽', style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: 'SFProDisplay',
                            ),),
                          ),
                          Text(' · '+weight.toString() + 'г', style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: 'SFProDisplay',
                          ),),
                        ],
                      ),
                      Container(
                          height: 100,
                          child: SingleChildScrollView(
                            child: Text(
                              description,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(0, 0, 0, 0.65),
                                fontFamily: 'SFProDisplay',
                              ),
                            ),
                          )),
                    ],
                  ),
                  Consumer<CartModel>(builder: (context, value, child) {
                    return MaterialButton(
                        minWidth: MediaQuery.of(context).size.width - 20,
                        height: 48,
                        color: Color.fromRGBO(51, 100, 224, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false).addItemToCart(
                              Dishes(id, itemName, price, weight, description, imagePath, tegs)
                          );
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Добавить в корзину',
                          style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Colors.white, fontSize: 18.0),
                        ));
                  })
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MaterialButton(
          height: 109,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Color.fromRGBO(248, 247, 245, 1),
          elevation: 0,
          onPressed: () => _dialogBuilder(context),
          child: Container(
            height: 109,
            width: 109,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(imagePath),
                  //fit: BoxFit.fill
                )),
              ),
            ),
          ),
        ),
        // // text
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(itemName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: 'SFProDisplay',
                  )),
            ))
      ],
    );
  }
}

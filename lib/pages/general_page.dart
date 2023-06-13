import 'package:flutter/material.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Consumer<CartModel>(
                    builder: (context, value, child){
                      return GridView.builder(
                          itemCount: value.shopItems.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1/ 1.25,
                          ),
                          itemBuilder: (context, index) {
                            return FoodItemTile(
                              itemName: value.shopItems[index][0],
                              itemPrice: value.shopItems[index][1],
                              imagePath: value.shopItems[index][2],
                              color: value.shopItems[index][3],
                              count: value.countOfItemName(value.shopItems[index][0]),
                              onPressed: () {
                                Provider.of<CartModel>(context, listen: false).addItemToCart(index);
                              },
                            );
                          } );
                    }
                )

            )
          ],
        ),

      ),
    );
  }
}

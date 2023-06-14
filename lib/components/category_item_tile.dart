import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/signle_category_page.dart';

class CategoryItemTile extends StatelessWidget {
  final int itemID;
  final String itemName;
  final String imagePath;

  CategoryItemTile({
    super.key,
    required this.itemID,
    required this.imagePath,
    required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: MaterialButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SingleCategoryPage();
        })),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.amberAccent[200],
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                itemName,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Image.network(
                imagePath,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

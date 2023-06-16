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
        onPressed: () => Navigator.pushNamed(context, 'Categories', arguments: ScreenArguments(itemName)),
          //   Navigator.push(context, MaterialPageRoute(builder: (context) {
          // return SingleCategoryPage(nameTitle: itemName);
        //})),

        child: Container(
            width: MediaQuery.of(context).size.width - 20,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20, left: 20, right: 50
              ),
              child:  Text(
                  itemName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  softWrap: true,
                ),
            ),
            decoration: BoxDecoration(
                color: Colors.amberAccent[200],
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: NetworkImage(imagePath), fit: BoxFit.fill))),
      ),
    );
  }
}
class ScreenArguments {
  final String nameTitle;
  ScreenArguments(this.nameTitle);
}


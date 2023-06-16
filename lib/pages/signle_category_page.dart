import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_hh_delivery_app/BNavigation/bottom_nav.dart';

import '../components/food_item_tile.dart';
import '../models/cart_model.dart';

class SingleCategoryPage extends StatelessWidget {
  const SingleCategoryPage({super.key, required this.nameTitle});

  final String nameTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //title: Text(nameTitle, style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
        //leadingWidth: MediaQuery.of(context).size.width,
        toolbarHeight: 60,
        elevation: 0,
        leadingWidth: MediaQuery.of(context).size.width,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BackButton(),
            Text(
              nameTitle,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            Icon(Icons.person)
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(child: FoodWidgets()),
      ),
    );
  }
}

class FoodWidgets extends StatefulWidget {
  const FoodWidgets({Key? key}) : super(key: key);

  @override
  State<FoodWidgets> createState() => _FoodWidgetsState();
}

class _FoodWidgetsState extends State<FoodWidgets> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Dishes>>(
      future: fetchData_dishes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 15,
                childAspectRatio: 1,
                mainAxisExtent: 146,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: FoodItemTile(
                    itemName: snapshot.data![index].name,
                    imagePath: snapshot.data![index].imageUrl,
                    price: snapshot.data![index].price,
                    weight: snapshot.data![index].weight,
                    description: snapshot.data![index].description,
                    id: snapshot.data![index].id,
                    tegs: snapshot.data![index].tegs,
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        // By default show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}

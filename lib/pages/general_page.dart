import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_hh_delivery_app/BNavigation/bottom_nav.dart';
import 'package:task_hh_delivery_app/models/categories_model.dart';
import 'package:task_hh_delivery_app/pages/signle_category_page.dart';

import '../BNavigation/routes.dart';
import '../components/category_item_tile.dart';


class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.white,

          iconTheme: const IconThemeData(color: Colors.black),

          leadingWidth: MediaQuery.of(context).size.width,
          toolbarHeight: 60,
          elevation: 0,
          leading:   const Row(
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
                      Text('Волгоград', style: TextStyle(
                          color: Colors.black, fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),),
                      Text('14 июня 2023', style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 50), fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 100, height: 1,),
              Icon(Icons.person)
            ],
          ),
        ),
        body: Material(
            elevation: 0,
            color: Colors.white,
            child: const CategoryWidget()));
  }

}


class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}
class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.25,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryItemTile(
                  itemID: snapshot.data![index].id,
                  itemName: snapshot.data![index].name,
                  imagePath: snapshot.data![index].image_url,
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
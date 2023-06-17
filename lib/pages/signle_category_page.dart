import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/food_item_tile.dart';
import '../models/cart_model.dart';

class SingleCategoryPage extends StatefulWidget {
  SingleCategoryPage({super.key, required this.nameTitle});

  final String nameTitle;

  @override
  State<SingleCategoryPage> createState() => _SingleCategoryPageState();
}

class _SingleCategoryPageState extends State<SingleCategoryPage> {
  String tagCurr = 'empty';

  void filterTag(String tagCurr0){
    setState(() {
      tagCurr = tagCurr0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
       iconTheme: const IconThemeData(color: Colors.black),
         toolbarHeight: 60,
          elevation: 0,
          leadingWidth: MediaQuery
              .of(context)
              .size
              .width,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Icon( Icons.arrow_back_ios, color: Colors.black,  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                } ,
              ),
              Text(
                widget.nameTitle,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  radius: 22, // Image radius
                  backgroundImage: NetworkImage('https://b1.filmpro.ru/c/150799.700xp.jpg'),
                ),
              )
            ],
          ),
        ),
        body:
            
        Material(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                      height: 50,
                      // buttons
                      child: FutureBuilder<List<String>>(
                        future: fetchTegs(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const ScrollPhysics(),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: MaterialButton(
                                      elevation: 0,
                                        height: 48,
                                        minWidth: 29,
                                        color:

                                        (tagCurr == 'empty' && snapshot.data![index] == snapshot.data![0])  || tagCurr == snapshot.data![index] ? Color.fromRGBO(51, 100, 224, 1):Color.fromRGBO(248, 247, 245, 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0)),
                                        onPressed: () {
                                          filterTag(snapshot.data![index]);

                                        },
                                        child: Text(
                                          snapshot.data![index],
                                          style: TextStyle(
                                              color:  (tagCurr == 'empty' && snapshot.data![index] == snapshot.data![0])  || tagCurr == snapshot.data![index] ? Colors.white:Colors.black,
                                              fontSize: 14.0,
                                            fontFamily: 'SFProDisplay',
                                          ),
                                        )),
                                  );
                                });
                          } else if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }
                          // By default show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      )),
              SizedBox(height: 16,),
              FutureBuilder<List<Dishes>>(
                future: fetchData_dishes(tagCurr),
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
                          mainAxisExtent: 148,
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
              )
                  ,
                ],
              ),
            ),
          ),
        )
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_hh_delivery_app/models/categories_model.dart';

import '../components/category_item_tile.dart';
import 'package:intl/intl.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});

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
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.white,

          iconTheme: const IconThemeData(color: Colors.black),

          leadingWidth: MediaQuery.of(context).size.width,
          toolbarHeight: 60,
          elevation: 0,
          leading:  Row(
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
                      Text('Волгоград', style: TextStyle(
                          color: Colors.black, fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),),
                      Text(getDateNow(), style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 100, height: 1,),
              CircleAvatar(
                radius: 22, // Image radius
                backgroundImage: NetworkImage('https://b1.filmpro.ru/c/150799.700xp.jpg'),
              )
            ],
          ),
        ),
        body: const Material(
            elevation: 0,
            color: Colors.white,
            child: CategoryWidget()));
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
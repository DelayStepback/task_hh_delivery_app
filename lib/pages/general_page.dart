import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_hh_delivery_app/models/categories_model.dart';

import '../components/category_item_tile.dart';



class BottomNavPanel extends StatefulWidget {
  const BottomNavPanel({super.key});

  @override
  State<BottomNavPanel> createState() => _BottomNavPanelState();
}

class _BottomNavPanelState extends State<BottomNavPanel> {

  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  Widget _listViewBody() {
    return ListView.separated(
        controller: _homeController,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Text(
              'Item $index',
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 1,
        ),
        itemCount: 50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: _listViewBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.open_in_new_rounded),
            label: 'Open Dialog',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          switch (index) {
            case 0:
            // only scroll to top when current index is selected.
              if (_selectedIndex == index) {
                _homeController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              }
            case 1:
              showModal(context);
          }
          setState(
                () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Example Dialog'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          )
        ],
      ),
    );
  }
}



class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(

        backgroundColor: Colors.white,

        iconTheme: IconThemeData(color: Colors.black),

        leadingWidth: MediaQuery.of(context).size.width,
        toolbarHeight: 80,
        elevation: 0,
        leading:   Row(
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
                        color: Colors.black, fontSize: 16,
                      ),),
                      Text('14 июня 2023', style: TextStyle(
                        color: Colors.grey, fontSize: 12,
                      ),),
                    ],
                  ),
                ],
            ),
            SizedBox(width: 100, height: 1,),
            Icon(Icons.person)
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Consumer<CategoryModel>(
                    builder: (context, value, child){
                      return GridView.builder(
                          itemCount: value.categories.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 2.25,
                          ),
                          itemBuilder: (context, index) {
                            return CategoryItemTile(
                              itemID: value.categories[index].id,
                              itemName: value.categories[index].name,
                              imagePath: value.categories[index].image_url,
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

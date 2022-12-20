import 'package:demo_bloc_crud/view/screen/login/sign_in.dart';
import 'package:demo_bloc_crud/view/screen/product_screen/add_products.dart';
import 'package:demo_bloc_crud/view/screen/product_screen/product_list.dart';
import 'package:demo_bloc_crud/view/screen/profile/profile_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constant/app_preference.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  DateTime selectedDate = DateTime.now();

  static const List<Widget> _widgetOptions = <Widget>[
    ProductList(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddProductScreen(),
                  ));
            },
            child: Icon(Icons.add)),
        appBar: AppBar(title: const Text("Product List"), actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
                onPressed: () {
                  CircularProgressIndicator(
                    color: Colors.yellow,
                  );

                  Future.delayed(
                    Duration(seconds: 3),
                    () {
                      AppPreference.clear();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    },
                  );
                },
                icon: const Icon(Icons.logout)),
          )
        ]),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        body: _widgetOptions.elementAt(_selectedIndex));
  }
}

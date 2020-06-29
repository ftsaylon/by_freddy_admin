/* -------------------------------- Packages -------------------------------- */
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Screens -------------------------------- */
/* -------------------------------------------------------------------------- */

/* --------------------------------- Widgets -------------------------------- */
import '../widgets/app_drawer.dart';
import '../widgets/profile.dart';
/* -------------------------------------------------------------------------- */

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
/* -------------------------- Bottom Navigation Bar ------------------------- */
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Profile(),
    Center(
      child: Text(
        'Index 1: Messages',
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('My Profile'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message),
      title: Text('Messages'),
    ),
  ];
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        actionsIconTheme: Theme.of(context).iconTheme,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

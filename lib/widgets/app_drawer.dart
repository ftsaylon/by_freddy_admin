/* -------------------------------- Packages -------------------------------- */
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Screens -------------------------------- */
import '../screens/home_screen.dart';
import '../screens/clients_screen.dart';
import '../screens/tradesmen_screen.dart';
import '../screens/prospects_screen.dart';
import '../screens/invoices_menu_screen.dart';
import '../screens/activities_screen.dart';
/* -------------------------------------------------------------------------- */

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Theme.of(context).primaryColor,
              child: DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ClipOval(
                      child: Container(
                        width: _deviceSize.width * 0.15,
                        child: Image.asset(
                          'assets/images/logos/profile_image_icon.png',
                        ),
                      ),
                    ),
                    OutlineButton(
                      onPressed: () {},
                      child: Text(
                        "View Profile",
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  HomeScreen.routeName,
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Clients'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  ClientsScreen.routeName,
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Tradesmen'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  TradesmenScreen.routeName,
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Prospects'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  ProspectsScreen.routeName,
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.flash_on),
              title: Text('Activities'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  ActivitiesScreen.routeName,
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Quote Requests'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.receipt),
              title: Text('Invoices'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  InvoicesMenuScreen.routeName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

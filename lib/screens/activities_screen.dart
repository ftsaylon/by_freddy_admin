/* -------------------------------- Packages -------------------------------- */
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Widgets -------------------------------- */
import '../widgets/app_drawer.dart';
/* -------------------------------------------------------------------------- */

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({Key key}) : super(key: key);

  static const routeName = '/activities';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Activities',
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
        actionsIconTheme: Theme.of(context).iconTheme,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      drawer: AppDrawer(),
    );
  }
}

/* -------------------------------- Packages -------------------------------- */
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Widgets -------------------------------- */
import '../widgets/app_drawer.dart';
/* -------------------------------------------------------------------------- */

class Prospect {
  final String id;
  final String name;
  final String country;

  Prospect(
    this.id,
    this.name,
    this.country,
  );
}

class ProspectsScreen extends StatelessWidget {
  const ProspectsScreen({Key key}) : super(key: key);

  static const routeName = '/prospects';

  @override
  Widget build(BuildContext context) {
    final prospects = [
      Prospect(
        '1',
        'Freddy - Enquiry',
        'United Kingdom',
      ),
      Prospect(
        '2',
        'Hampshire - My Builder',
        'United Kingdom',
      ),
      Prospect(
        '3',
        'Rated People',
        'United Kingdom',
      ),
      Prospect(
        '4',
        'Online Enquiry - Contact Made',
        'United Kingdom',
      ),
      Prospect(
        '5',
        'Appointment - Hampshire',
        'United Kingdom',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Prospects',
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
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${prospects[index].name}'),
              onTap: () {},
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: prospects.length,
        ),
      ),
    );
  }
}

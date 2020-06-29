/* -------------------------------- Packages -------------------------------- */
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Widgets -------------------------------- */
import '../widgets/app_drawer.dart';
/* -------------------------------------------------------------------------- */

class Client {
  final String id;
  final String name;
  final String country;

  Client(
    this.id,
    this.name,
    this.country,
  );
}

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({Key key}) : super(key: key);

  static const routeName = '/clients';

  @override
  Widget build(BuildContext context) {
    final clients = [
      Client(
        '1',
        'Freddy - Enquiry',
        'United Kingdom',
      ),
      Client(
        '2',
        'Hampshire - My Builder',
        'United Kingdom',
      ),
      Client(
        '3',
        'Rated People',
        'United Kingdom',
      ),
      Client(
        '4',
        'Online Enquiry - Contact Made',
        'United Kingdom',
      ),
      Client(
        '5',
        'Appointment - Hampshire',
        'United Kingdom',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Clients',
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
              title: Text('${clients[index].name}'),
              onTap: () {},
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: clients.length,
        ),
      ),
    );
  }
}

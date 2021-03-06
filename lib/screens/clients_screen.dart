/* -------------------------------- Packages -------------------------------- */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
/* -------------------------------------------------------------------------- */

/* -------------------------------- Providers ------------------------------- */
import '../providers/clients.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Widgets -------------------------------- */
import '../widgets/app_drawer.dart';
/* -------------------------------------------------------------------------- */

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({Key key}) : super(key: key);

  static const routeName = '/clients';

  @override
  Widget build(BuildContext context) {
    final clients = Provider.of<Clients>(context).clients;

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

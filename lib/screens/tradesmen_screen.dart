/* -------------------------------- Packages -------------------------------- */
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Widgets -------------------------------- */
import '../widgets/app_drawer.dart';
/* -------------------------------------------------------------------------- */

class Tradesman {
  final String id;
  final String name;
  final String country;

  Tradesman(
    this.id,
    this.name,
    this.country,
  );
}

class TradesmenScreen extends StatelessWidget {
  const TradesmenScreen({Key key}) : super(key: key);

  static const routeName = '/tradesmen';

  @override
  Widget build(BuildContext context) {
    final tradesmen = [
      Tradesman(
        '1',
        'Members - Trademan - Hampshire',
        'United Kingdom',
      ),
      Tradesman(
        '2',
        'Hampshire - Roofing - Trademan',
        'United Kingdom',
      ),
      Tradesman(
        '3',
        'Hampshire - Bathrooms - Trademan',
        'United Kingdom',
      ),
      Tradesman(
        '4',
        'Hampshire - Brick Laying - Trademan',
        'United Kingdom',
      ),
      Tradesman(
        '5',
        'Hampshire - Carpentry - Trademan',
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
              title: Text('${tradesmen[index].name}'),
              onTap: () {},
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: tradesmen.length,
        ),
      ),
    );
  }
}

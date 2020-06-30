/* -------------------------------- Packages -------------------------------- */
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Screens -------------------------------- */
import '../screens/invoices_screen.dart';
import '../screens/quotes_screen.dart';
import '../screens/edit_invoice_screen.dart';
import '../screens/edit_quote_screen.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Widgets -------------------------------- */
import '../widgets/app_drawer.dart';
/* -------------------------------------------------------------------------- */

enum Choice {
  invoices,
  quotes,
}

class InvoicesMenuScreen extends StatelessWidget {
  static const routeName = '/invoices_menu';

  final _countries = [
    'Australia',
    'United Kingdom',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Invoices',
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
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.receipt),
            title: Text('View Invoices'),
            onTap: () => _showSelectCountry(context, Choice.invoices),
          ),
          ListTile(
            leading: Icon(Icons.receipt),
            title: Text('Create Invoice'),
            onTap: () {
              Navigator.of(context).pushNamed(EditInvoiceScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.note),
            title: Text('View Quotes'),
            onTap: () => _showSelectCountry(context, Choice.quotes),
          ),
          ListTile(
            leading: Icon(Icons.note),
            title: Text('Create Quote'),
            onTap: () {
              Navigator.of(context).pushNamed(EditQuoteScreen.routeName);
            },
          ),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */

  void _showSelectCountry(BuildContext context, Choice choice) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              child: ListTile(
                title: Center(
                  child: Text(
                    'SELECT COUNTRY',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: _countries.map((country) {
                  return ListTile(
                    title: Text('$country'),
                    onTap: () {
                      Navigator.of(context).pop();
                      switch (choice) {
                        case Choice.invoices:
                          Navigator.of(context).pushNamed(
                            InvoicesScreen.routeName,
                            arguments: country,
                          );
                          break;
                        case Choice.quotes:
                          Navigator.of(context).pushNamed(
                            QuotesScreen.routeName,
                            arguments: country,
                          );
                          break;
                        default:
                      }
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }

/* -------------------------------------------------------------------------- */
}

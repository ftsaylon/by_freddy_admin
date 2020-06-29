/* -------------------------------- Packages -------------------------------- */
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Screens -------------------------------- */
import './screens/auth_screen.dart';
import './screens/home_screen.dart';
import './screens/clients_screen.dart';
import './screens/prospects_screen.dart';
import './screens/tradesmen_screen.dart';
import './screens/invoices_menu_screen.dart';
import './screens/invoices_screen.dart';
import './screens/quotes_screen.dart';
import './screens/edit_invoice_screen.dart';
import './screens/edit_quote_screen.dart';
/* -------------------------------------------------------------------------- */

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'By Freddy',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.white,
        accentTextTheme: TextTheme(
          button: TextStyle(color: Colors.white),
        ),
        iconTheme: IconTheme.of(context).copyWith(
          color: Colors.white,
        ),
        appBarTheme: AppBarTheme.of(context).copyWith(
          iconTheme: IconTheme.of(context).copyWith(
            color: Colors.white,
          ),
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.orange,
          textTheme: ButtonTextTheme.normal,
        ),
      ),
      home: AuthScreen(),
      routes: {
        AuthScreen.routeName: (context) => AuthScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        ClientsScreen.routeName: (context) => ClientsScreen(),
        TradesmenScreen.routeName: (context) => TradesmenScreen(),
        ProspectsScreen.routeName: (context) => ProspectsScreen(),
        InvoicesMenuScreen.routeName: (context) => InvoicesMenuScreen(),
        InvoicesScreen.routeName: (context) => InvoicesScreen(),
        QuotesScreen.routeName: (context) => QuotesScreen(),
        EditInvoiceScreen.routeName: (context) => EditInvoiceScreen(),
        EditQuoteScreen.routeName: (context) => EditQuoteScreen(),
      },
    );
  }
}

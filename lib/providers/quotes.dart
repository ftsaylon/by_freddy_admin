/* -------------------------------- Packages -------------------------------- */
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Models --------------------------------- */
import '../models/quote_model.dart';
/* -------------------------------------------------------------------------- */

class Quotes with ChangeNotifier {
  List<Quote> _quotes = [
    Quote(
      id: '1',
      freddyNumber: '1234',
      quoteNumber: 'INV-1234',
      country: 'United Kingdom',
      company: 'By Freddy',
      clientId: '1',
      dateOfIssue: DateTime.now(),
      dueDate: DateTime.now().add(Duration(days: 30)),
      budget: '10000',
      items: null,
      notes: 'Thank you!',
      subTotal: 10000,
      tax: 1000,
      total: 11000,
      amountPaid: 0,
      amountDue: 11000,
    ),
    Quote(
      id: '2',
      freddyNumber: '1235',
      quoteNumber: 'INV-1235',
      country: 'United Kingdom',
      company: 'By Freddy',
      clientId: '2',
      dateOfIssue: DateTime.now(),
      dueDate: DateTime.now().add(Duration(days: 30)),
      budget: '10000',
      items: null,
      notes: 'Thank you!',
      subTotal: 10000,
      tax: 1000,
      total: 11000,
      amountPaid: 0,
      amountDue: 11000,
    ),
    Quote(
      id: '3',
      freddyNumber: '1236',
      quoteNumber: 'INV-1236',
      country: 'United Kingdom',
      company: 'By Freddy',
      clientId: '3',
      dateOfIssue: DateTime.now(),
      dueDate: DateTime.now().add(Duration(days: 30)),
      budget: '10000',
      items: null,
      notes: 'Thank you!',
      subTotal: 10000,
      tax: 1000,
      total: 11000,
      amountPaid: 0,
      amountDue: 11000,
    ),
  ];

  List<Quote> get quotes {
    return [..._quotes];
  }

  List<Quote> getByCountry(String country) {
    return [..._quotes.where((quote) => quote.country == country)];
  }

  Quote findById(String id) {
    return _quotes.firstWhere((quote) => quote.id == id);
  }
}

/* -------------------------------- Packages -------------------------------- */
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Models --------------------------------- */
import '../models/invoice_model.dart';
/* -------------------------------------------------------------------------- */

class Invoices with ChangeNotifier {
  List<Invoice> _invoices = [
    Invoice(
      id: '1',
      freddyNumber: '1234',
      invoiceNumber: 'INV-1234',
      country: 'United Kingdom',
      company: 'By Freddy',
      clientId: '1',
      dateOfIssue: DateTime.now(),
      dueDate: DateTime.now().add(Duration(days: 30)),
      budget: 'A',
      items: [],
      notes: 'Thank you!',
      subTotal: 10000,
      tax: 1000,
      total: 11000,
      amountPaid: 0,
      amountDue: 11000,
    ),
    Invoice(
      id: '2',
      freddyNumber: '1235',
      invoiceNumber: 'INV-1235',
      country: 'United Kingdom',
      company: 'By Freddy',
      clientId: '2',
      dateOfIssue: DateTime.now(),
      dueDate: DateTime.now().add(Duration(days: 30)),
      budget: 'B',
      items: [],
      notes: 'Thank you!',
      subTotal: 10000,
      tax: 1000,
      total: 11000,
      amountPaid: 0,
      amountDue: 11000,
    ),
    Invoice(
      id: '3',
      freddyNumber: '1236',
      invoiceNumber: 'INV-1236',
      country: 'United Kingdom',
      company: 'By Freddy',
      clientId: '3',
      dateOfIssue: DateTime.now(),
      dueDate: DateTime.now().add(Duration(days: 30)),
      budget: 'C',
      items: [],
      notes: 'Thank you!',
      subTotal: 10000,
      tax: 1000,
      total: 11000,
      amountPaid: 0,
      amountDue: 11000,
    ),
  ];

  List<Invoice> get invoices {
    return [..._invoices];
  }

  List<Invoice> getByCountry(String country) {
    return [..._invoices.where((invoice) => invoice.country == country)];
  }

  Invoice findById(String id) {
    return _invoices.firstWhere((invoice) => invoice.id == id);
  }
}

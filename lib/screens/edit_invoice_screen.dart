/* -------------------------------- Packages -------------------------------- */
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Models --------------------------------- */
import '../models/invoice_model.dart';
/* -------------------------------------------------------------------------- */

enum ActivityDate {
  issue,
  due,
}

class EditInvoiceScreen extends StatefulWidget {
  EditInvoiceScreen({Key key}) : super(key: key);

  static const routeName = '/edit-invoice';

  @override
  _EditInvoiceScreenState createState() => _EditInvoiceScreenState();
}

class _EditInvoiceScreenState extends State<EditInvoiceScreen> {
  final _form = GlobalKey<FormState>();
  final _countryFocusNode = FocusNode();
  final _companyFocusNode = FocusNode();
  final _clientIdFocusNode = FocusNode();
  final _notesFocusNode = FocusNode();

  var _editedInvoice = Invoice(
    id: null,
    country: '',
    company: '',
    clientId: '',
    dateOfIssue: null,
    dueDate: null,
    budget: '',
    items: [],
    notes: '',
    subTotal: 0,
    tax: 0,
    total: 0,
    amountPaid: 0,
    amountDue: 0,
  );

  var _initValues = {
    'id': '',
    'country': '',
    'company': '',
    'clientId': '',
    'dateOfIssue': null,
    'dueDate': null,
    'budget': '',
    'items': [],
    'notes': '',
    'subTotal': 0,
    'tax': 0,
    'total': 0,
    'amountPaid': 0,
    'amountDue': 0,
  };

  @override
  void dispose() {
    _countryFocusNode.dispose();
    _companyFocusNode.dispose();
    _clientIdFocusNode.dispose();
    _notesFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Create Invoice',
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
          iconTheme: Theme.of(context).iconTheme,
          actionsIconTheme: Theme.of(context).iconTheme,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {},
            ),
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
        body: _buildForm(context),
      ),
    );
  }

  Form _buildForm(BuildContext context) {
    return Form(
      key: _form,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 24),
              width: double.infinity,
              color: Theme.of(context).primaryColorLight,
              child: Column(
                children: <Widget>[
                  Text(
                    'AMOUNT DUE',
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${_editedInvoice.amountDue}',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'COUNTRY',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: _initValues['country'],
                    decoration: InputDecoration(
                      labelText: 'Country',
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    focusNode: _countryFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(
                        _companyFocusNode,
                      );
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide a value';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _editedInvoice = Invoice(
                        id: _editedInvoice.id,
                        country: value,
                        company: _editedInvoice.company,
                        clientId: _editedInvoice.clientId,
                        dateOfIssue: _editedInvoice.dateOfIssue,
                        dueDate: _editedInvoice.dueDate,
                        budget: _editedInvoice.budget,
                        items: _editedInvoice.items,
                        notes: _editedInvoice.notes,
                        subTotal: _editedInvoice.subTotal,
                        tax: _editedInvoice.tax,
                        total: _editedInvoice.total,
                        amountPaid: _editedInvoice.amountPaid,
                        amountDue: _editedInvoice.amountDue,
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'COMPANY',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: _initValues['company'],
                    decoration: InputDecoration(
                      labelText: 'Company',
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    focusNode: _companyFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(
                        _clientIdFocusNode,
                      );
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide a value';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _editedInvoice = Invoice(
                        id: _editedInvoice.id,
                        country: _editedInvoice.country,
                        company: value,
                        clientId: _editedInvoice.clientId,
                        dateOfIssue: _editedInvoice.dateOfIssue,
                        dueDate: _editedInvoice.dueDate,
                        budget: _editedInvoice.budget,
                        items: _editedInvoice.items,
                        notes: _editedInvoice.notes,
                        subTotal: _editedInvoice.subTotal,
                        tax: _editedInvoice.tax,
                        total: _editedInvoice.total,
                        amountPaid: _editedInvoice.amountPaid,
                        amountDue: _editedInvoice.amountDue,
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'BILLED TO',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: _initValues['clientId'],
                    decoration: InputDecoration(
                      labelText: 'Client Name',
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    focusNode: _clientIdFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(
                        _notesFocusNode,
                      );
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide a value';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _editedInvoice = Invoice(
                        id: _editedInvoice.id,
                        country: _editedInvoice.country,
                        company: _editedInvoice.company,
                        clientId: value,
                        dateOfIssue: _editedInvoice.dateOfIssue,
                        dueDate: _editedInvoice.dueDate,
                        budget: _editedInvoice.budget,
                        items: _editedInvoice.items,
                        notes: _editedInvoice.notes,
                        subTotal: _editedInvoice.subTotal,
                        tax: _editedInvoice.tax,
                        total: _editedInvoice.total,
                        amountPaid: _editedInvoice.amountPaid,
                        amountDue: _editedInvoice.amountDue,
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'DATE OF ACTIVITY',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  DateField(
                    label: 'Date of Issue',
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    selectedDate: _editedInvoice.dateOfIssue,
                    onDateSelected: (DateTime date) {
                      setState(() {
                        _editedInvoice = Invoice(
                          id: _editedInvoice.id,
                          country: _editedInvoice.country,
                          company: _editedInvoice.company,
                          clientId: _editedInvoice.clientId,
                          dateOfIssue: date,
                          dueDate: _editedInvoice.dueDate,
                          budget: _editedInvoice.budget,
                          items: _editedInvoice.items,
                          notes: _editedInvoice.notes,
                          subTotal: _editedInvoice.subTotal,
                          tax: _editedInvoice.tax,
                          total: _editedInvoice.total,
                          amountPaid: _editedInvoice.amountPaid,
                          amountDue: _editedInvoice.amountDue,
                        );
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  DateField(
                    label: 'Due Date',
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    selectedDate: _editedInvoice.dueDate,
                    onDateSelected: (DateTime date) {
                      setState(() {
                        _editedInvoice = Invoice(
                          id: _editedInvoice.id,
                          country: _editedInvoice.country,
                          company: _editedInvoice.company,
                          clientId: _editedInvoice.clientId,
                          dateOfIssue: _editedInvoice.dateOfIssue,
                          dueDate: date,
                          budget: _editedInvoice.budget,
                          items: _editedInvoice.items,
                          notes: _editedInvoice.notes,
                          subTotal: _editedInvoice.subTotal,
                          tax: _editedInvoice.tax,
                          total: _editedInvoice.total,
                          amountPaid: _editedInvoice.amountPaid,
                          amountDue: _editedInvoice.amountDue,
                        );
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'BUDGET',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text('A'),
                                Checkbox(
                                  activeColor: Theme.of(context).primaryColor,
                                  value: (_editedInvoice.budget == 'A'),
                                  onChanged: (value) {
                                    setState(() {
                                      _editedInvoice = Invoice(
                                        id: _editedInvoice.id,
                                        country: _editedInvoice.country,
                                        company: _editedInvoice.company,
                                        clientId: _editedInvoice.clientId,
                                        dateOfIssue: _editedInvoice.dateOfIssue,
                                        dueDate: _editedInvoice.dueDate,
                                        budget: 'A',
                                        items: _editedInvoice.items,
                                        notes: _editedInvoice.notes,
                                        subTotal: _editedInvoice.subTotal,
                                        tax: _editedInvoice.tax,
                                        total: _editedInvoice.total,
                                        amountPaid: _editedInvoice.amountPaid,
                                        amountDue: _editedInvoice.amountDue,
                                      );
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('B'),
                                Checkbox(
                                  activeColor: Theme.of(context).primaryColor,
                                  value: (_editedInvoice.budget == 'B'),
                                  onChanged: (value) {
                                    setState(() {
                                      _editedInvoice = Invoice(
                                        id: _editedInvoice.id,
                                        country: _editedInvoice.country,
                                        company: _editedInvoice.company,
                                        clientId: _editedInvoice.clientId,
                                        dateOfIssue: _editedInvoice.dateOfIssue,
                                        dueDate: _editedInvoice.dueDate,
                                        budget: 'B',
                                        items: _editedInvoice.items,
                                        notes: _editedInvoice.notes,
                                        subTotal: _editedInvoice.subTotal,
                                        tax: _editedInvoice.tax,
                                        total: _editedInvoice.total,
                                        amountPaid: _editedInvoice.amountPaid,
                                        amountDue: _editedInvoice.amountDue,
                                      );
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('C'),
                                Checkbox(
                                  activeColor: Theme.of(context).primaryColor,
                                  value: (_editedInvoice.budget == 'C'),
                                  onChanged: (value) {
                                    setState(() {
                                      _editedInvoice = Invoice(
                                        id: _editedInvoice.id,
                                        country: _editedInvoice.country,
                                        company: _editedInvoice.company,
                                        clientId: _editedInvoice.clientId,
                                        dateOfIssue: _editedInvoice.dateOfIssue,
                                        dueDate: _editedInvoice.dueDate,
                                        budget: 'C',
                                        items: _editedInvoice.items,
                                        notes: _editedInvoice.notes,
                                        subTotal: _editedInvoice.subTotal,
                                        tax: _editedInvoice.tax,
                                        total: _editedInvoice.total,
                                        amountPaid: _editedInvoice.amountPaid,
                                        amountDue: _editedInvoice.amountDue,
                                      );
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {},
                            child: Text(
                              '+ ADD ANOTHER ITEM',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'NOTES',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          initialValue: _initValues['notes'],
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText:
                                'Enter additional instructions here (Optional)',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 4,
                          focusNode: _notesFocusNode,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please provide a value';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _editedInvoice = Invoice(
                              id: _editedInvoice.id,
                              country: _editedInvoice.country,
                              company: _editedInvoice.company,
                              clientId: _editedInvoice.clientId,
                              dateOfIssue: _editedInvoice.dateOfIssue,
                              dueDate: _editedInvoice.dueDate,
                              budget: _editedInvoice.budget,
                              items: _editedInvoice.items,
                              notes: value,
                              subTotal: _editedInvoice.subTotal,
                              tax: _editedInvoice.tax,
                              total: _editedInvoice.total,
                              amountPaid: _editedInvoice.amountPaid,
                              amountDue: _editedInvoice.amountDue,
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        _buildSummary(),
                        Container(
                          width: double.infinity,
                          child: RaisedButton(
                            child: Text(
                              'SAVE',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildSummary() {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'SUBTOTAL',
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('${_editedInvoice.subTotal}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'TAX',
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('${_editedInvoice.tax}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'TOTAL',
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('${_editedInvoice.total}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'AMOUNT PAID',
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('${_editedInvoice.amountPaid}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'AMOUNT DUE',
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('${_editedInvoice.amountDue}'),
            ],
          ),
        ],
      ),
    );
  }
}

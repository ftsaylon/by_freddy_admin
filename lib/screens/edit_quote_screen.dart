/* -------------------------------- Packages -------------------------------- */
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Models --------------------------------- */
import '../models/quote_model.dart';
/* -------------------------------------------------------------------------- */

enum ActivityDate {
  issue,
  due,
}

class EditQuoteScreen extends StatefulWidget {
  EditQuoteScreen({Key key}) : super(key: key);

  static const routeName = '/edit-quote';

  @override
  _EditQuoteScreenState createState() => _EditQuoteScreenState();
}

class _EditQuoteScreenState extends State<EditQuoteScreen> {
  final _form = GlobalKey<FormState>();
  final _countryFocusNode = FocusNode();
  final _companyFocusNode = FocusNode();
  final _clientFocusNode = FocusNode();
  final _notesFocusNode = FocusNode();

  var _editedQuote = Quote(
    id: null,
    country: '',
    company: '',
    client: '',
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
    'client': '',
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
    _clientFocusNode.dispose();
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
            'Create Quote',
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
                    '${_editedQuote.amountDue}',
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
                      _editedQuote = Quote(
                        id: _editedQuote.id,
                        country: value,
                        company: _editedQuote.company,
                        client: _editedQuote.client,
                        dateOfIssue: _editedQuote.dateOfIssue,
                        dueDate: _editedQuote.dueDate,
                        budget: _editedQuote.budget,
                        items: _editedQuote.items,
                        notes: _editedQuote.notes,
                        subTotal: _editedQuote.subTotal,
                        tax: _editedQuote.tax,
                        total: _editedQuote.total,
                        amountPaid: _editedQuote.amountPaid,
                        amountDue: _editedQuote.amountDue,
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
                        _clientFocusNode,
                      );
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide a value';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _editedQuote = Quote(
                        id: _editedQuote.id,
                        country: _editedQuote.country,
                        company: value,
                        client: _editedQuote.client,
                        dateOfIssue: _editedQuote.dateOfIssue,
                        dueDate: _editedQuote.dueDate,
                        budget: _editedQuote.budget,
                        items: _editedQuote.items,
                        notes: _editedQuote.notes,
                        subTotal: _editedQuote.subTotal,
                        tax: _editedQuote.tax,
                        total: _editedQuote.total,
                        amountPaid: _editedQuote.amountPaid,
                        amountDue: _editedQuote.amountDue,
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
                    initialValue: _initValues['client'],
                    decoration: InputDecoration(
                      labelText: 'Client Name',
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    focusNode: _clientFocusNode,
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
                      _editedQuote = Quote(
                        id: _editedQuote.id,
                        country: _editedQuote.country,
                        company: _editedQuote.company,
                        client: value,
                        dateOfIssue: _editedQuote.dateOfIssue,
                        dueDate: _editedQuote.dueDate,
                        budget: _editedQuote.budget,
                        items: _editedQuote.items,
                        notes: _editedQuote.notes,
                        subTotal: _editedQuote.subTotal,
                        tax: _editedQuote.tax,
                        total: _editedQuote.total,
                        amountPaid: _editedQuote.amountPaid,
                        amountDue: _editedQuote.amountDue,
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
                    selectedDate: _editedQuote.dateOfIssue,
                    onDateSelected: (DateTime date) {
                      setState(() {
                        _editedQuote = Quote(
                          id: _editedQuote.id,
                          country: _editedQuote.country,
                          company: _editedQuote.company,
                          client: _editedQuote.client,
                          dateOfIssue: date,
                          dueDate: _editedQuote.dueDate,
                          budget: _editedQuote.budget,
                          items: _editedQuote.items,
                          notes: _editedQuote.notes,
                          subTotal: _editedQuote.subTotal,
                          tax: _editedQuote.tax,
                          total: _editedQuote.total,
                          amountPaid: _editedQuote.amountPaid,
                          amountDue: _editedQuote.amountDue,
                        );
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  DateField(
                    label: 'Due Date',
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    selectedDate: _editedQuote.dueDate,
                    onDateSelected: (DateTime date) {
                      setState(() {
                        _editedQuote = Quote(
                          id: _editedQuote.id,
                          country: _editedQuote.country,
                          company: _editedQuote.company,
                          client: _editedQuote.client,
                          dateOfIssue: _editedQuote.dateOfIssue,
                          dueDate: date,
                          budget: _editedQuote.budget,
                          items: _editedQuote.items,
                          notes: _editedQuote.notes,
                          subTotal: _editedQuote.subTotal,
                          tax: _editedQuote.tax,
                          total: _editedQuote.total,
                          amountPaid: _editedQuote.amountPaid,
                          amountDue: _editedQuote.amountDue,
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
                                  value: (_editedQuote.budget == 'A'),
                                  onChanged: (value) {
                                    setState(() {
                                      _editedQuote = Quote(
                                        id: _editedQuote.id,
                                        country: _editedQuote.country,
                                        company: _editedQuote.company,
                                        client: _editedQuote.client,
                                        dateOfIssue: _editedQuote.dateOfIssue,
                                        dueDate: _editedQuote.dueDate,
                                        budget: 'A',
                                        items: _editedQuote.items,
                                        notes: _editedQuote.notes,
                                        subTotal: _editedQuote.subTotal,
                                        tax: _editedQuote.tax,
                                        total: _editedQuote.total,
                                        amountPaid: _editedQuote.amountPaid,
                                        amountDue: _editedQuote.amountDue,
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
                                  value: (_editedQuote.budget == 'B'),
                                  onChanged: (value) {
                                    setState(() {
                                      _editedQuote = Quote(
                                        id: _editedQuote.id,
                                        country: _editedQuote.country,
                                        company: _editedQuote.company,
                                        client: _editedQuote.client,
                                        dateOfIssue: _editedQuote.dateOfIssue,
                                        dueDate: _editedQuote.dueDate,
                                        budget: 'B',
                                        items: _editedQuote.items,
                                        notes: _editedQuote.notes,
                                        subTotal: _editedQuote.subTotal,
                                        tax: _editedQuote.tax,
                                        total: _editedQuote.total,
                                        amountPaid: _editedQuote.amountPaid,
                                        amountDue: _editedQuote.amountDue,
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
                                  value: (_editedQuote.budget == 'C'),
                                  onChanged: (value) {
                                    setState(() {
                                      _editedQuote = Quote(
                                        id: _editedQuote.id,
                                        country: _editedQuote.country,
                                        company: _editedQuote.company,
                                        client: _editedQuote.client,
                                        dateOfIssue: _editedQuote.dateOfIssue,
                                        dueDate: _editedQuote.dueDate,
                                        budget: 'C',
                                        items: _editedQuote.items,
                                        notes: _editedQuote.notes,
                                        subTotal: _editedQuote.subTotal,
                                        tax: _editedQuote.tax,
                                        total: _editedQuote.total,
                                        amountPaid: _editedQuote.amountPaid,
                                        amountDue: _editedQuote.amountDue,
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
                            _editedQuote = Quote(
                              id: _editedQuote.id,
                              country: _editedQuote.country,
                              company: _editedQuote.company,
                              client: _editedQuote.client,
                              dateOfIssue: _editedQuote.dateOfIssue,
                              dueDate: _editedQuote.dueDate,
                              budget: _editedQuote.budget,
                              items: _editedQuote.items,
                              notes: value,
                              subTotal: _editedQuote.subTotal,
                              tax: _editedQuote.tax,
                              total: _editedQuote.total,
                              amountPaid: _editedQuote.amountPaid,
                              amountDue: _editedQuote.amountDue,
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
              Text('${_editedQuote.subTotal}'),
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
              Text('${_editedQuote.tax}'),
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
              Text('${_editedQuote.total}'),
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
              Text('${_editedQuote.amountPaid}'),
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
              Text('${_editedQuote.amountDue}'),
            ],
          ),
        ],
      ),
    );
  }
}

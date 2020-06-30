/* -------------------------------- Packages -------------------------------- */
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Models --------------------------------- */
import '../models/client_model.dart';
import '../models/invoice_model.dart';
/* -------------------------------------------------------------------------- */

/* -------------------------------- Providers ------------------------------- */
import '../providers/clients.dart';
import '../providers/invoices.dart';
/* -------------------------------------------------------------------------- */

class InvoiceDetailScreen extends StatelessWidget {
  const InvoiceDetailScreen({Key key}) : super(key: key);

  static const routeName = '/invoice-detail';

  @override
  Widget build(BuildContext context) {
    final invoiceId = ModalRoute.of(context).settings.arguments;
    final invoice = Provider.of<Invoices>(context).findById(invoiceId);
    final client = Provider.of<Clients>(context).findById(invoice.clientId);

    final _deviceSize = MediaQuery.of(context).size;

    final formatCurrency = NumberFormat.currency(locale: 'en_UK', symbol: '£');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Invoice ${invoice.invoiceNumber}',
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
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('INVOICES'),
                      Row(
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.purple,
                            child: Text(
                              'Back',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(width: 10),
                          RaisedButton(
                            color: Colors.pink,
                            child: Text(
                              'Download PDF',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              _buildHeaders(_deviceSize, context, client, invoice),
              _buildActivityTable(_deviceSize, invoice, formatCurrency),
            ],
          ),
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */

  Container _buildSummary(NumberFormat formatCurrency, Invoice invoice) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'SUBTOTAL:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'VAT:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'TOTAL:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'AMOUNT PAID:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'BALANCE:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${formatCurrency.format(invoice.subTotal)}'),
              Text('${formatCurrency.format(invoice.tax)}'),
              Text('${formatCurrency.format(invoice.total)}'),
              Text('${formatCurrency.format(invoice.amountPaid)}'),
              Text('${formatCurrency.format(invoice.amountDue)}'),
            ],
          ),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */

  Card _buildActivityTable(
    Size _deviceSize,
    Invoice invoice,
    NumberFormat formatCurrency,
  ) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: DataTable(
              columnSpacing: _deviceSize.width * 0.1,
              columns: <DataColumn>[
                DataColumn(
                  label: Text('Activity'),
                ),
                DataColumn(
                  label: Text('Rate'),
                ),
                DataColumn(
                  label: Text('Qty'),
                ),
                DataColumn(
                  label: Text('VAT'),
                ),
                DataColumn(
                  label: Text('Total'),
                ),
              ],
              rows: <DataRow>[
                ...invoice.items.map(
                  (item) {
                    return DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Text('${item.activity}'),
                        ),
                        DataCell(
                          Text('${formatCurrency.format(item.rate)}'),
                        ),
                        DataCell(
                          Text('${formatCurrency.format(item.quantity)}'),
                        ),
                        DataCell(
                          Text('${item.tax}'),
                        ),
                        DataCell(
                          Text('${formatCurrency.format(item.total)}'),
                        ),
                      ],
                    );
                  },
                ).toList(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(invoice.notes),
          ),
          _buildSummary(formatCurrency, invoice),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    Text('Hampshire'),
                    Text('Shop 4 50 Pylewell, Hythe, Southampton, Hampshire'),
                    Text('United Kingdom, SO45 6AQ'),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: <Widget>[
                    Text('Account Name: By Freddy'),
                    Text('SORT: 20-11-43'),
                    Text('Account Number: 03822931'),
                    Text('10% Deposit, Fully Refundable'),
                    Text('Once you signed, you will be issued a contract.'),
                    Text('This contract states all our terms and conditions.'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */

  Card _buildHeaders(
    Size _deviceSize,
    BuildContext context,
    Client client,
    Invoice invoice,
  ) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('By Freddy Hampshire Ltd'),
                    Text('0808 164 2339'),
                    Text('Shop 4 50 Pylewell, Hythe'),
                    Text('Southampton, Hampshire'),
                    Text('United Kingdom, SO45 6AQ'),
                  ],
                ),
                Container(
                  width: _deviceSize.width * 0.4,
                  child: Image.asset(
                    'assets/images/logos/byfreddy_logo.png',
                  ),
                ),
              ],
            ),
            Divider(),
            Text(
              'INVOICE',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'ADDRESS',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(client.name),
                    Text(client.address),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'FREDDY NO:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(invoice.freddyNumber),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'INVOICE NO:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(invoice.invoiceNumber),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'DATE:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${DateFormat.yMd().format(invoice.dueDate)}',
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'CREATED AT:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${DateFormat.yMd().format(invoice.dateOfIssue)}',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: (invoice.budget == 'A')
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColorLight,
                    child: Text(
                      'GRADE A',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: (invoice.budget == 'B')
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColorLight,
                    child: Text(
                      'GRADE B',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: (invoice.budget == 'C')
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColorLight,
                    child: Text(
                      'GRADE C',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
}

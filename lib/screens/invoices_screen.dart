/* -------------------------------- Packages -------------------------------- */
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Screens -------------------------------- */
import 'package:by_freddy_admin/screens/edit_invoice_screen.dart';
/* -------------------------------------------------------------------------- */

enum ActionOptions {
  Open,
  Won,
  Lost,
}

class Invoice {
  final String id;
  final int freddyNumber;
  final String invoiceNumber;
  final String customer;

  Invoice(
    this.id,
    this.freddyNumber,
    this.invoiceNumber,
    this.customer,
  );
}

class InvoicesScreen extends StatelessWidget {
  const InvoicesScreen({Key key}) : super(key: key);

  static const routeName = '/invoices';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    final invoices = [
      Invoice(
        '1',
        1298,
        'INV-2367',
        'Pauline Thom',
      ),
      Invoice(
        '2',
        1297,
        'INV-2349',
        'Stephen Liddlard',
      ),
      Invoice(
        '3',
        1296,
        'INV-2348',
        'Carina Maylam',
      ),
      Invoice(
        '4',
        1294,
        'INV-2321',
        'Stuart Morley',
      ),
      Invoice(
        '5',
        1293,
        'INV-2319',
        'Stuart Morley',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Invoices',
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
        iconTheme: Theme.of(context).iconTheme,
        actionsIconTheme: Theme.of(context).iconTheme,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditInvoiceScreen.routeName);
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          _buildPopupMenuButton(context),
        ],
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        child: DataTable(
          columnSpacing: deviceSize.width * 0.05,
          columns: <DataColumn>[
            DataColumn(
              label: Expanded(
                child: Text('Freddy #'),
              ),
            ),
            DataColumn(
              label: Text('Invoice #'),
            ),
            DataColumn(
              label: Text('Customer'),
            ),
            DataColumn(
              label: Text('Actions'),
            ),
          ],
          rows: invoices
              .map(
                (invoice) => DataRow(
                  cells: [
                    DataCell(
                      Text('${invoice.freddyNumber}'),
                    ),
                    DataCell(
                      Text('${invoice.invoiceNumber}'),
                    ),
                    DataCell(
                      Text('${invoice.customer}'),
                    ),
                    DataCell(
                      Center(child: Icon(Icons.more_horiz)),
                      onTap: () {
                        _showActions(context);
                      },
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
/* -------------------------------------------------------------------------- */

  void _showActions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.view_module),
              title: Text('View'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.content_copy),
              title: Text('Copy Invoice'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.sync),
              title: Text('Sync'),
              onTap: () {},
            ),
          ],
        );
      },
    );
  }

/* -------------------------------------------------------------------------- */

  PopupMenuButton<ActionOptions> _buildPopupMenuButton(BuildContext context) {
    return PopupMenuButton(
      onSelected: (ActionOptions selectedValue) {
        switch (selectedValue) {
          case ActionOptions.Open:
            break;
          case ActionOptions.Won:
            break;
          case ActionOptions.Lost:
            break;
          default:
        }
      },
      icon: Icon(
        Icons.more_vert,
      ),
      itemBuilder: (_) => [
        PopupMenuItem(
          child: Text('Open'),
          value: ActionOptions.Open,
        ),
        PopupMenuItem(
          child: Text('Won'),
          value: ActionOptions.Won,
        ),
        PopupMenuItem(
          child: Text('Lost'),
          value: ActionOptions.Lost,
        ),
      ],
    );
  }

/* -------------------------------------------------------------------------- */
}

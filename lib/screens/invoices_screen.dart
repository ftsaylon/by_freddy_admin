/* -------------------------------- Packages -------------------------------- */
import '../screens/invoice_details_screen.dart';
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* -------------------------------- Providers ------------------------------- */
import '../providers/clients.dart';
import '../providers/invoices.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Screens -------------------------------- */
import '../screens/edit_invoice_screen.dart';
import 'package:provider/provider.dart';
/* -------------------------------------------------------------------------- */

enum ActionOptions {
  Open,
  Won,
  Lost,
}

class InvoicesScreen extends StatelessWidget {
  InvoicesScreen({Key key}) : super(key: key);

  static const routeName = '/invoices';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final country = ModalRoute.of(context).settings.arguments;

    final invoices = Provider.of<Invoices>(context).getByCountry(country);

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
      body: (invoices.isNotEmpty)
          ? Container(
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
                rows: invoices.map(
                  (invoice) {
                    final client = Provider.of<Clients>(context)
                        .findById(invoice.clientId);
                    return DataRow(
                      cells: [
                        DataCell(
                          Text('${invoice.freddyNumber}'),
                        ),
                        DataCell(
                          Text('${invoice.invoiceNumber}'),
                        ),
                        DataCell(
                          Text('${client.name}'),
                        ),
                        DataCell(
                          Center(child: Icon(Icons.more_horiz)),
                          onTap: () {
                            _showActions(context, invoice.id);
                          },
                        ),
                      ],
                    );
                  },
                ).toList(),
              ),
            )
          : Center(
              child: Text(
                'No invoices yet, please select another country.',
              ),
            ),
    );
  }
/* -------------------------------------------------------------------------- */

  void _showActions(BuildContext context, String invoiceId) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.view_module),
              title: Text('View'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(
                  InvoiceDetailScreen.routeName,
                  arguments: invoiceId,
                );
              },
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

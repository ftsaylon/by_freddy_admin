/* -------------------------------- Packages -------------------------------- */
import '../providers/quotes.dart';
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* -------------------------------- Providers ------------------------------- */
import '../providers/clients.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Screens -------------------------------- */
import '../screens/edit_quote_screen.dart';
import 'package:provider/provider.dart';
/* -------------------------------------------------------------------------- */

enum ActionOptions {
  Edit,
  Delete,
  Send,
  Copy,
  Accept,
}

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({Key key}) : super(key: key);

  static const routeName = '/quotes';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final country = ModalRoute.of(context).settings.arguments;
    final quotes = Provider.of<Quotes>(context).getByCountry(country);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quotes',
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
              Navigator.of(context).pushNamed(EditQuoteScreen.routeName);
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
      body: (quotes.isNotEmpty)
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
                    label: Text('Quote #'),
                  ),
                  DataColumn(
                    label: Text('Customer'),
                  ),
                  DataColumn(
                    label: Text('Actions'),
                  ),
                ],
                rows: quotes.map((quote) {
                  final client =
                      Provider.of<Clients>(context).findById(quote.clientId);
                  return DataRow(
                    cells: [
                      DataCell(
                        Text('${quote.freddyNumber}'),
                      ),
                      DataCell(
                        Text('${quote.quoteNumber}'),
                      ),
                      DataCell(
                        Text('${client.name}'),
                      ),
                      DataCell(
                        Center(child: Icon(Icons.more_horiz)),
                        onTap: () {
                          _showItemActions(context);
                        },
                      ),
                    ],
                  );
                }).toList(),
              ),
            )
          : Center(
              child: Text(
                'No quotes yet, please select another country.',
              ),
            ),
    );
  }

/* -------------------------------------------------------------------------- */

  void _showItemActions(BuildContext context) {
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
              title: Text('Copy Quote'),
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
          case ActionOptions.Edit:
            break;
          case ActionOptions.Delete:
            break;
          case ActionOptions.Send:
            break;
          case ActionOptions.Copy:
            break;
          case ActionOptions.Accept:
            break;
          default:
        }
      },
      icon: Icon(
        Icons.more_vert,
      ),
      itemBuilder: (_) => [
        PopupMenuItem(
          child: Text('Edit'),
          value: ActionOptions.Edit,
        ),
        PopupMenuItem(
          child: Text('Delete'),
          value: ActionOptions.Delete,
        ),
        PopupMenuItem(
          child: Text('Send'),
          value: ActionOptions.Send,
        ),
        PopupMenuItem(
          child: Text('Copy'),
          value: ActionOptions.Copy,
        ),
        PopupMenuItem(
          child: Text('Accept'),
          value: ActionOptions.Accept,
        ),
      ],
    );
  }

/* -------------------------------------------------------------------------- */
}

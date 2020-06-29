/* -------------------------------- Packages -------------------------------- */
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Screens -------------------------------- */
import 'package:by_freddy_admin/screens/edit_quote_screen.dart';
/* -------------------------------------------------------------------------- */

enum ActionOptions {
  Edit,
  Delete,
  Send,
  Copy,
  Accept,
}

class Quote {
  final String id;
  final int freddyNumber;
  final String quoteNumber;
  final String customer;

  Quote(
    this.id,
    this.freddyNumber,
    this.quoteNumber,
    this.customer,
  );
}

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({Key key}) : super(key: key);

  static const routeName = '/quotes';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    final quotes = [
      Quote(
        '1',
        1298,
        'INV-2367',
        'Pauline Thom',
      ),
      Quote(
        '2',
        1297,
        'INV-2349',
        'Stephen Liddlard',
      ),
      Quote(
        '3',
        1296,
        'INV-2348',
        'Carina Maylam',
      ),
      Quote(
        '4',
        1294,
        'INV-2321',
        'Stuart Morley',
      ),
      Quote(
        '5',
        1293,
        'INV-2319',
        'Stuart Morley',
      ),
    ];

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
              label: Text('Quote #'),
            ),
            DataColumn(
              label: Text('Customer'),
            ),
            DataColumn(
              label: Text('Actions'),
            ),
          ],
          rows: quotes
              .map(
                (quote) => DataRow(
                  cells: [
                    DataCell(
                      Text('${quote.freddyNumber}'),
                    ),
                    DataCell(
                      Text('${quote.quoteNumber}'),
                    ),
                    DataCell(
                      Text('${quote.customer}'),
                    ),
                    DataCell(
                      Center(child: Icon(Icons.more_horiz)),
                      onTap: () {
                        _showItemActions(context);
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

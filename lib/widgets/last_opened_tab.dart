import 'package:flutter/material.dart';

class LastOpenedItem {
  final String id;
  final String title;
  final String contact;

  LastOpenedItem(
    this.id,
    this.title,
    this.contact,
  );
}

class LastOpenedTab extends StatelessWidget {
  const LastOpenedTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lastOpenedItems = [
      LastOpenedItem(
        '1',
        'SOUTHHAMPTON-Painting',
        'Lukas Migda',
      ),
      LastOpenedItem(
        '2',
        'SALISBURY-Painting',
        'Serge Beaumont',
      ),
      LastOpenedItem(
        '3',
        'Painting',
        'Lukaw Weigel',
      ),
      LastOpenedItem(
        '4',
        'BASINGSTROKE - Bathrooms By Freddy',
        'Beena Bala',
      ),
      LastOpenedItem(
        '5',
        'NORTH SHIELDS-Mowing',
        'miniq1',
      ),
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Wrap(
              children: <Widget>[
                Text(
                  '${lastOpenedItems[index].contact} - ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${lastOpenedItems[index].title}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            subtitle: Text('${lastOpenedItems[index].contact}'),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: lastOpenedItems.length,
      ),
    );
  }
}

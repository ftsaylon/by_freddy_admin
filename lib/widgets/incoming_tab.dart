import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IncomingItem {
  final String id;
  final String contactNumber;
  final String emailAddress;
  final String address;
  final DateTime date;

  IncomingItem(
    this.id,
    this.contactNumber,
    this.emailAddress,
    this.address,
    this.date,
  );
}

class IncomingTab extends StatelessWidget {
  const IncomingTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final incomings = [
      IncomingItem(
        '5ef5c4fffc13ae6d18000000',
        '495-665-3591',
        'chatter0@scribd.com',
        '560 Commercial Alley',
        DateTime.now(),
      ),
      IncomingItem(
        '5ef5c4fffc13ae6d18000001',
        "774-107-4890",
        "fbauld1@naver.com",
        "136 Pawling Lane",
        DateTime.now(),
      ),
      IncomingItem(
        "5ef5c4fffc13ae6d18000002",
        "184-594-5499",
        "fpoyser2@hibu.com",
        "33 Golden Leaf Center",
        DateTime.now(),
      ),
      IncomingItem(
        "5ef5c4fffc13ae6d18000003",
        "418-246-5369",
        "opherps3@vk.com",
        "255 Oxford Plaza",
        DateTime.now(),
      ),
      IncomingItem(
        "5ef5c4fffc13ae6d18000004",
        "402-524-8573",
        "acraythorne4@cdbaby.com",
        "5164 Farmco Center",
        DateTime.now(),
      ),
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: incomings.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Wrap(
              children: <Widget>[
                Text(
                  '${incomings[index].contactNumber} - ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${incomings[index].emailAddress} - ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${incomings[index].address}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${DateFormat.yMEd().add_jms().format(incomings[index].date)}',
                ),
                Row(
                  children: <Widget>[
                    OutlineButton(
                      onPressed: () {},
                      child: Text('Deals'),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'Reply',
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 10),
                    RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'View',
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

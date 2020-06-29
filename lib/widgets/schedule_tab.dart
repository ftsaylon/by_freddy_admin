import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleItem {
  final String id;
  final String title;
  final String contact;
  final String description;
  final String action;
  final DateTime date;

  ScheduleItem(
    this.id,
    this.title,
    this.contact,
    this.description,
    this.action,
    this.date,
  );
}

class ScheduleTab extends StatelessWidget {
  const ScheduleTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final schedules = [
      ScheduleItem(
        '1',
        '?',
        'Mukal Madan',
        'SOUTHHAMPTION - Painting',
        'SMS and EMAIL SEND',
        DateTime.now(),
      ),
      ScheduleItem(
        '2',
        'Job won - In Progress',
        'Baljeet Sansoa',
        'EASTLEIGH-Freddy',
        'SMS and EMAIL SEND',
        DateTime.now(),
      ),
      ScheduleItem(
        '3',
        '(Text) Make Lost. If no Answer.',
        'Alia idris',
        'SANDHURST - plumbing',
        'SMS and EMAIL SEND',
        DateTime.now(),
      ),
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${schedules[index].title}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('${schedules[index].action}'),
                SizedBox(height: 10),
                Wrap(
                  children: <Widget>[
                    Text(
                      '${schedules[index].contact} - ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${schedules[index].description}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${DateFormat.yMEd().add_jms().format(schedules[index].date)}',
                ),
                Row(
                  children: <Widget>[
                    OutlineButton(
                      onPressed: () {},
                      child: Text('Cancel'),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'View',
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: schedules.length,
      ),
    );
  }
}

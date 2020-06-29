/* -------------------------------- Packages -------------------------------- */
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Screens -------------------------------- */
import '../screens/auth_screen.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Widgets -------------------------------- */
import '../widgets/incoming_tab.dart';
import '../widgets/last_opened_tab.dart';
import '../widgets/schedule_tab.dart';
/* -------------------------------------------------------------------------- */

class Profile extends StatefulWidget {
  const Profile({
    Key key,
  }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
/* --------------------------------- Tab Bar -------------------------------- */

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Activity'),
    Tab(text: 'Incoming'),
    Tab(text: 'Scheduled'),
    Tab(text: 'Last Opened'),
  ];

  TabController _tabController;
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _deviceSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ClipOval(
                  child: Container(
                    width: _deviceSize.width * 0.15,
                    child: Image.asset(
                      'assets/images/logos/profile_image_icon.png',
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    OutlineButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                        color: Theme.of(context).accentColor,
                      ),
                      label: Text(
                        'Settings',
                        style: Theme.of(context).accentTextTheme.button,
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    OutlineButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(
                          AuthScreen.routeName,
                        );
                      },
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Theme.of(context).accentColor,
                      ),
                      label: Text(
                        'Log out',
                        style: Theme.of(context).accentTextTheme.button,
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            width: double.infinity,
            child: Center(
              child: TabBar(
                isScrollable: true,
                labelColor: Theme.of(context).accentColor,
                controller: _tabController,
                tabs: myTabs,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Container(child: Center(child: Text('Activity'))),
                  IncomingTab(),
                  ScheduleTab(),
                  LastOpenedTab(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

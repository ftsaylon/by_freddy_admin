/* -------------------------------- Packages -------------------------------- */
import 'package:flutter/material.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Widgets -------------------------------- */
import '../widgets/auth_form.dart';
/* -------------------------------------------------------------------------- */

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key key}) : super(key: key);

  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/backgrounds/login_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      height: _deviceSize.height * 0.1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/logos/byfreddy_logo.png',
                          ),
                        ),
                      ),
                    ),
                    AuthForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

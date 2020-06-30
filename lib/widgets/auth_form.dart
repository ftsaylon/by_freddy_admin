/* -------------------------------- Packages -------------------------------- */
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
/* -------------------------------------------------------------------------- */

/* --------------------------------- Screens -------------------------------- */
import '../screens/home_screen.dart';
/* -------------------------------------------------------------------------- */

class AuthForm extends StatefulWidget {
  AuthForm({Key key}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Email Address',
                  contentPadding: EdgeInsets.all(10)),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                return value;
              },
              onSaved: (value) {},
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Password', contentPadding: EdgeInsets.all(10)),
              obscureText: true,
              validator: (value) {
                return value;
              },
              onSaved: (value) {},
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(HomeScreen.routeName);
                },
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                color: Theme.of(context).primaryColor,
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Forgot Password?'),
            ),
            Container(
              width: double.infinity,
              child: SignInButton(
                Buttons.Facebook,
                onPressed: () {},
              ),
            ),
            Container(
              width: double.infinity,
              child: SignInButton(
                Buttons.Google,
                onPressed: () {},
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Terms and Conditions'),
            ),
          ],
        ),
      ),
    );
  }
}

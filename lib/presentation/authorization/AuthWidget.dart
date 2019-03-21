import 'package:flutter/material.dart';

import 'AuthPresenter.dart';
import 'AuthView.dart';

class Authorization extends StatelessWidget implements AuthView {
  Authorization({Key key}) : super(key: key) {
    AuthPresenter authPresenter = new AuthPresenter(this);
  }

  final _logo = Hero(
    tag: 'hero',
    child: CircleAvatar(
      radius: 96.0,
      child: Image.asset('images/login.png'),
    ),
  );

  final FocusNode _passwordFocus = new FocusNode();

  @override
  Widget build(BuildContext context) {
    final _email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (String string) {
        FocusScope.of(context).requestFocus(_passwordFocus);
      },
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final _password = TextFormField(
      autofocus: false,
      obscureText: true,
      focusNode: _passwordFocus,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final _loginButton = Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed(HomePage.tag);
        },
        padding: EdgeInsets.all(12),
        colorBrightness: Brightness.light,
        color: Colors.white,
        child: Text('Log In', style: TextStyle(color: Colors.redAccent)),
      ),
    );

    final _guestLoginButton = RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () {
        //Navigator.of(context).pushNamed(HomePage.tag);
      },
      padding: EdgeInsets.all(12),
      colorBrightness: Brightness.light,
      color: Colors.white,
      child: Text('Start guest session',
          style: TextStyle(color: Colors.redAccent)),
    );

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:ScrollConfiguration(behavior: MyBehavior(), child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            _logo,
            SizedBox(height: 48.0),
            _email,
            SizedBox(height: 8.0),
            _password,
            SizedBox(height: 24.0),
            _loginButton,
            _guestLoginButton
          ],
        ),
      ),
    ));
  }

  @override
  void authError() {}

  @override
  void authSuccess() {}
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

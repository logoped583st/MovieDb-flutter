import 'package:flutter/material.dart';
import 'package:logopeds_movies/presentation/CustomProgress.dart';
import 'package:logopeds_movies/presentation/popularmovies/PopularMoviesWidget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'AuthPresenter.dart';
import 'AuthView.dart';

class MyHomePage extends StatefulWidget {
  @override
  Authorization createState() {
    return new Authorization();
  }
}

class Authorization extends State<MyHomePage> implements AuthView {
  AuthPresenter _presenter;
  final FocusNode _passwordFocus = new FocusNode();
  final FocusNode _emailFocus = new FocusNode();
  final TextEditingController _loginTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  WillPopScope popScope;

  final _logo = Hero(
    tag: 'hero',
    child: CircleAvatar(
      radius: 96.0,
      child: Image.asset('images/login.png'),
    ),
  );

  @override
  void initState() {
    super.initState();
    _presenter = new AuthPresenter(this);
    _presenter.validateInputs(_loginTextController, _passwordTextController);
  }

  @override
  void dispose() {
    _passwordFocus.dispose();
    _emailFocus.dispose();
    _presenter.presenterDestroy();
    _loginTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _login = TextFormField(
      controller: _loginTextController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      focusNode: _emailFocus,
      autovalidate: true,
      validator: (value) {
        return !_presenter.getLoginOrPasswordIncorrect() ? null : '';
      },
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (String string) {
        FocusScope.of(context).requestFocus(_passwordFocus);
      },
      decoration: InputDecoration(
        hintText: 'Login',
        prefixIcon: Icon(MdiIcons.ninja),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(),
      ),
    );

    final _password = TextFormField(
      autofocus: false,
      obscureText: true,
      maxLines: 1,
      controller: _passwordTextController,
      focusNode: _passwordFocus,
      autovalidate: true,
      validator: (value) {
        return !_presenter.getLoginOrPasswordIncorrect()
            ? null
            : 'Login or password incorrect';
      },
      decoration: InputDecoration(
        hintText: 'Password',
        prefixIcon: Icon(MdiIcons.security),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(),
      ),
    );

    final _loginContainer = Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: !_presenter.isButtonEnabled()
            ? null
            : () {
                _presenter.signInWithLogin();
              },
        padding: EdgeInsets.all(12),
        colorBrightness: Brightness.light,
        child: Text('Log In', style: TextStyle(color: Colors.redAccent)),
      ),
    );

    final _guestLoginContainer = RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () {
        _presenter.guestLogin();
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return WillPopScope(
                  child: Center(child: CustomProgress()), onWillPop: () {},);
            });
      },
      padding: EdgeInsets.all(12),
      colorBrightness: Brightness.light,
      child: Text('Start guest session',
          style: TextStyle(color: Colors.redAccent)),
    );

    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                _logo,
                SizedBox(height: 48.0),
                _login,
                SizedBox(height: 16.0),
                _password,
                SizedBox(height: 24.0),
                _loginContainer,
                _guestLoginContainer
              ],
            ),
          ),
        ));
  }

  @override
  void authError() {}

  @override
  void authSuccess() {
    Navigator.pop(context);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => PopularMoviesPage()));
  }

  @override
  void updateState() {
    setState(() {});
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

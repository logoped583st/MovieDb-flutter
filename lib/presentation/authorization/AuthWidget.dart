import 'package:flutter/material.dart';
import 'AuthView.dart';
import 'AuthPresenter.dart';

class Authorization extends StatelessWidget implements AuthView {

  Authorization({Key key}) : super(key: key){
    AuthPresenter authPresenter = new AuthPresenter(this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World'),

      ),
    );
  }

  @override
  void authError() {

  }

  @override
  void authSuccess() {

  }
}
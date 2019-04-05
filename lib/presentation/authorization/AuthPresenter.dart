import 'package:flutter/material.dart';
import 'package:logopeds_movies/pojo/AuthResponse.dart';
import 'package:logopeds_movies/pojo/SesionResponse.dart';

import '../../MVP/MVPPresenter.dart';
import '../../utils/BaseHttp.dart';
import 'AuthIInteractor.dart';
import 'AuthInteractor.dart';
import 'AuthView.dart';

class AuthPresenter extends MVPPresenter<AuthView, AuthInteractor>
    implements AuthIInteractor {
  final RegExp emailRegex = RegExp(pattern);

  AuthPresenter(AuthView authView) : super(authView);

  String _login;

  String _password;

  bool _loginOrPasswordIncorrect = false;

  getLoginOrPasswordIncorrect() => _loginOrPasswordIncorrect;

  @override
  AuthInteractor createInteractor() {
    return AuthInteractor(this);
  }

  bool _buttonEnabled = false;

  bool isButtonEnabled() => _buttonEnabled;

  void validateInputs(TextEditingController login,
      TextEditingController password) {
    login.addListener(() {
      _buttonEnabled = login.text.isNotEmpty && password.text.isNotEmpty;
      _login = login.text;
      _loginOrPasswordIncorrect = false;
      getView().updateState();
    });

    password.addListener(() {
      _buttonEnabled = login.text.isNotEmpty && password.text.isNotEmpty;
      _password = password.text;
      _loginOrPasswordIncorrect = false;
      getView().updateState();
    });
  }

  void signInWithLogin() {
    getInteractor().loginWithLogin(_login, _password);
  }

  void guestLogin() {
    getInteractor().guestLogin();
  }

  bool checkRegular(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  @override
  void signInSuccess(RequestToken requestToken) {
    getView().authSuccess();
  }

  @override
  void guestSessionSuccess(SessionResponse sessionResponse) {
    getView().authSuccess();
  }

  @override
  void incorrectLoginOrPassword() {
    _loginOrPasswordIncorrect = true;
    getView().updateState();
  }
}

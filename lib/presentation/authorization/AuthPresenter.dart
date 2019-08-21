import 'package:flutter/material.dart';
import 'package:logopeds_movies/pojo/AuthResponse.dart';
import 'package:logopeds_movies/pojo/SesionResponse.dart';

import '../../MVP/MVPPresenter.dart';
import 'AuthRepository.dart';
import 'AuthView.dart';

class AuthPresenter extends MVPPresenter<AuthView, AuthRepository>
    implements IAuthRepository {

  AuthPresenter(AuthView authView) : super(authView);

  String _login;

  String _password;

  bool _loginOrPasswordIncorrect = false;

  getLoginOrPasswordIncorrect() => _loginOrPasswordIncorrect;

  @override
  AuthRepository createRepository() {
    return AuthRepository(this);
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
    getRepository().loginWithLogin(_login, _password);
  }

  void guestLogin() {
    getRepository().guestLogin();
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

import 'package:flutter/material.dart';

import '../../MVP/MVPPresenter.dart';
import '../../utils/BaseHttp.dart';
import 'AuthIInteractor.dart';
import 'AuthInteractor.dart';
import 'AuthView.dart';

class AuthPresenter extends MVPPresenter<AuthView, AuthInteractor>
    implements AuthIInteractor {

  final RegExp emailRegex = RegExp(pattern);
  bool isValid = true;

  AuthPresenter(AuthView authView) : super(authView);

  @override
  AuthInteractor createInteractor() {
    return AuthInteractor(this);
  }

  void checkFocus(FocusNode focus) {
    focus.addListener(() {
      isValid = focus.hasFocus;
      getView().focusEmailChanged(isValid);
    });
  }

  bool checkRegular(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

}

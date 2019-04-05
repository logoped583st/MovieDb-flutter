import '../../MVP/MVPInteractor.dart';
import 'AuthPresenter.dart';
import 'AuthIInteractor.dart';
import '../../pojo/AuthResponse.dart';
import '../../pojo/SesionResponse.dart';
import '../../networking/errors/Errors.dart';

import 'package:logopeds_movies/networking/repository/AuthApi.dart';

class AuthInteractor extends MVPInteractor {
  AuthIInteractor _interactor;
  AuthRepository _authRep;

  AuthInteractor(AuthPresenter presenter) : super(presenter) {
    _interactor = presenter;
    _authRep = new Auth();
  }

  void loginWithLogin(String login, String password) async {
    try {
      RequestToken requestToken = await _authRep.signIn(login, password);
      _interactor.signInSuccess(requestToken);
    } on Exception {
      _interactor.incorrectLoginOrPassword();
    }
  }

  void guestLogin() async {
    try {
      SessionResponse sessionResponse = await _authRep.createGuestSession();
      _interactor.guestSessionSuccess(sessionResponse);
    } catch (error) {}
  }
}

import 'package:logopeds_movies/MVP/MVPInteractor.dart';
import 'package:logopeds_movies/networking/repository/AuthApi.dart';
import 'package:logopeds_movies/pojo/AuthResponse.dart';
import 'package:logopeds_movies/pojo/SesionResponse.dart';
import 'package:logopeds_movies/presentation/authorization/AuthIInteractor.dart';

class AuthInteractor extends MVPInteractor<AuthIInteractor> {
  AuthIInteractor _interactor;
  final AuthRepository _authRep = new Auth();

  AuthInteractor(this._interactor) : super(_interactor);

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

  @override
  void test() {
    _interactor = null;
  }
}

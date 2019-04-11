import 'package:logopeds_movies/MVP/MVPInteractor.dart';
import 'package:logopeds_movies/networking/repository/AuthApi.dart';
import 'package:logopeds_movies/pojo/AuthResponse.dart';
import 'package:logopeds_movies/pojo/SesionResponse.dart';
import 'package:logopeds_movies/presentation/authorization/AuthIInteractor.dart';
import 'package:logopeds_movies/presentation/authorization/AuthPresenter.dart';

class AuthInteractor extends MVPInteractor<AuthIInteractor> {
  final AuthRepository _authRep = new Auth();

  AuthInteractor(AuthPresenter presenter) : super(presenter);

  void loginWithLogin(String login, String password) async {
    try {
      RequestToken requestToken = await _authRep.signIn(login, password);
      presenter().signInSuccess(requestToken);
    } on Exception {
      presenter().incorrectLoginOrPassword();
    }
  }

  void guestLogin() async {
    try {
      SessionResponse sessionResponse = await _authRep.createGuestSession();
      presenter().guestSessionSuccess(sessionResponse);
    } catch (error) {}
  }
}

import 'package:flutter/cupertino.dart';
import 'package:logopeds_movies/MVP/MVPIRepository.dart';
import 'package:logopeds_movies/MVP/MVPRepository.dart';
import 'package:logopeds_movies/networking/api/AuthApi.dart';
import 'package:logopeds_movies/pojo/AuthResponse.dart';
import 'package:logopeds_movies/pojo/SesionResponse.dart';
import 'package:logopeds_movies/presentation/authorization/AuthPresenter.dart';

class AuthRepository extends MVPRepository<IAuthRepository> {
  final IAuthApi _authRep = new AuthApi();

  AuthRepository(AuthPresenter presenter) : super(presenter);

  void loginWithLogin(String login, String password) async {
    try {
      RequestToken requestToken = await _authRep.signIn(login, password);
      presenter().signInSuccess(requestToken);
    } catch (error) {
      debugPrint(error.toString());
      presenter().incorrectLoginOrPassword();
    }
  }

  void guestLogin() async {
    try {
      SessionResponse sessionResponse = await _authRep.createGuestSession();
      presenter().guestSessionSuccess(sessionResponse);
    } catch (error) {
      debugPrint(error.toString());
    }
  }

}
abstract class IAuthRepository implements MVPIRepository{

  void signInSuccess(RequestToken requestToken);

  void guestSessionSuccess(SessionResponse sessionResponse);

  void incorrectLoginOrPassword();

}
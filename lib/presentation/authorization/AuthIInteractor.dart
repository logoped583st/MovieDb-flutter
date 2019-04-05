import '../../MVP/MVPIInteractor.dart';
import '../../pojo/AuthResponse.dart';
import '../../pojo/SesionResponse.dart';

abstract class AuthIInteractor implements MVPIInteractor{

  void signInSuccess(RequestToken requestToken);

  void guestSessionSuccess(SessionResponse sessionResponse);

  void incorrectLoginOrPassword();

}
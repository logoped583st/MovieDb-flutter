import '../../MVP/MVPInteractor.dart';
import 'AuthPresenter.dart';
import 'AuthIInteractor.dart';
import '../../networking/AuthApi.dart';

class AuthInteractor extends MVPInteractor {

  AuthIInteractor _interactor;
  AuthRepository _authRep;

  AuthInteractor(AuthPresenter presenter) : super(presenter){
    _interactor = presenter;
    _authRep = new Auth();
  }


}

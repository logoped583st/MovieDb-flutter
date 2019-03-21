import '../../MVP/MVPInteractor.dart';
import 'AuthPresenter.dart';
import 'AuthIInteractor.dart';

class AuthInteractor extends MVPInteractor {

  AuthIInteractor _interactor;

  AuthInteractor(AuthPresenter presenter) : super(presenter){
    _interactor = presenter;
  }

}

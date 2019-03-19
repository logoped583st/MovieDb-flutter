import '../../MVP/MVPPresenter.dart';
import 'AuthIInteractor.dart';
import 'AuthInteractor.dart';
import 'AuthView.dart';

class AuthPresenter extends MVPPresenter<AuthView, AuthInteractor>
    implements AuthIInteractor {
  AuthPresenter(AuthView authView) : super(authView);

  @override
  AuthInteractor createInteractor() {
    return AuthInteractor(this);
  }
}

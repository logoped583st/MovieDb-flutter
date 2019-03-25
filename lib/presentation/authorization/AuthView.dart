import '../../MVP/MVPIView.dart';

abstract class AuthView implements MVPIView {
  void authSuccess();

  void authError();

  void focusEmailChanged(bool isFocusable);

}

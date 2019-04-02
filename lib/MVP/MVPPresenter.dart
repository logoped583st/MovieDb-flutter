import 'MVPIInteractor.dart';
import 'MVPIView.dart';
import 'MVPInteractor.dart';

abstract class MVPPresenter<V extends MVPIView, T extends MVPInteractor>
    implements MVPIInteractor {
  V _baseView;

  T _interactor;

  MVPPresenter(V baseView) {
    _baseView = baseView;
    _interactor = createInteractor();
  }

  T createInteractor();

  void presenterDestroy() {
    _baseView = null;
  }

  T getInteractor() => _interactor;

  V getView() => _baseView;
}

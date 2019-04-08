import 'MVPIInteractor.dart';
import 'MVPIView.dart';
import 'MVPInteractor.dart';

abstract class MVPPresenter<V extends MVPIView, T extends MVPInteractor>
    implements MVPIInteractor {

  final V _baseView;

  T _interactor;

  MVPPresenter(this._baseView) {
    _interactor = createInteractor();
  }

  T createInteractor();

  void presenterDestroy() {
    _interactor = null;
  }

  T getInteractor() => _interactor;

  V getView() => _baseView;
}

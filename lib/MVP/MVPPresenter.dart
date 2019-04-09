import 'MVPIInteractor.dart';
import 'MVPIView.dart';
import 'MVPInteractor.dart';

abstract class MVPPresenter<V extends MVPIView, T extends MVPInteractor>
    implements MVPIInteractor {

  V _baseView;

  T _interactor;

  MVPPresenter(this._baseView) {
    _interactor = createInteractor();
  }

  T createInteractor();

  @override
  void presenterDestroy() {
    getInteractor().interactorDestroy();
    _baseView = null;
  }

  T getInteractor() {
    if (_interactor != null) {
      return _interactor;
    } else {
      createInteractor();
      return _interactor;
    }
  }


  V getView() => _baseView;

}

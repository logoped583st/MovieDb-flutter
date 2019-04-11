import 'MVPIInteractor.dart';

abstract class MVPInteractor <T extends MVPIInteractor>{

    T _interactor;

    T presenter() => _interactor;

    MVPInteractor(T presenter) {
      _interactor = presenter;
    }
}
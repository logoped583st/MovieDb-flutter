import 'package:async/async.dart';

import 'MVPIInteractor.dart';
import 'MVPIView.dart';
import 'MVPInteractor.dart';

abstract class MVPPresenter<V extends MVPIView, T extends MVPInteractor>
    implements MVPIInteractor {
  Map<CancelableOperation, CancelableOperation> _map = {};

  void addToCancelable<K>(Future<K> future) {
    CancelableOperation cancelableOperation =
        CancelableOperation.fromFuture(future);
    _map.addAll({cancelableOperation: cancelableOperation});
  }

  V _baseView;

  T _interactor;

  MVPPresenter(this._baseView) {
    _interactor = createInteractor();
  }

  T createInteractor();

  @override
  void presenterDestroy() {
    _baseView = null;
    _interactor = null;
    _map.forEach((key, value) {
      value.cancel();
    });
  }

  T getInteractor() => _interactor;

  V getView() => _baseView;
}

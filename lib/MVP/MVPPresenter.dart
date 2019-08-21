import 'package:async/async.dart';

import 'MVPIRepository.dart';
import 'MVPIView.dart';
import 'MVPRepository.dart';

abstract class MVPPresenter<V extends MVPIView, T extends MVPRepository>
    implements MVPIRepository {
  Map<CancelableOperation, CancelableOperation> _map = {};

  void addToCancelable<K>(Future<K> future) {
    CancelableOperation cancelableOperation =
        CancelableOperation.fromFuture(future);
    _map.addAll({cancelableOperation: cancelableOperation});
  }

  V _baseView;

  T repository;

  MVPPresenter(this._baseView) {
    repository = createRepository();
  }

  T createRepository();

  @override
  void presenterDestroy() {
    _baseView = null;
    repository = null;
    _map.forEach((key, value) {
      value.cancel();
    });
  }

  T getRepository() => repository;

  V getView() => _baseView;
}

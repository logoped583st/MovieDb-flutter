import 'MVPIRepository.dart';

abstract class MVPRepository <T extends MVPIRepository>{

    T _repositoty;

    T presenter() => _repositoty;

    MVPRepository(T presenter) {
      _repositoty = presenter;
    }
}
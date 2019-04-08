import 'package:logopeds_movies/MVP/MVPIInteractor.dart';
import 'package:logopeds_movies/networking/repository/PopularMoviesApi.dart';
import 'package:logopeds_movies/pojo/BaseResponse.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:logopeds_movies/presentation/popularmovies/PopularMoviesIInteractor.dart';

import '../../MVP/MVPInteractor.dart';

class PopularMoviesInteractor extends MVPInteractor {
  final PopularMoviesIInteractor _interactor;
  PopularMoviesRepository _moviesRepository = new PopularMovies();

  PopularMoviesInteractor(this._interactor) : super(_interactor);

  void getPopularMovies() async {
    BaseResponse<Movie> movies = await _moviesRepository.getPopularMovies();
    _interactor.getPopularMovies(movies.result);
  }
}

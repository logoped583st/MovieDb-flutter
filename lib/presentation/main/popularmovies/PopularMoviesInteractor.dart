import 'package:logopeds_movies/MVP/MVPInteractor.dart';
import 'package:logopeds_movies/networking/repository/PopularMoviesApi.dart';
import 'package:logopeds_movies/pojo/BaseResponse.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:logopeds_movies/presentation/main/popularmovies/PopularMoviesIInteractor.dart';

class PopularMoviesInteractor extends MVPInteractor<PopularMoviesIInteractor> {
  PopularMoviesIInteractor _interactor;
  PopularMoviesRepository _moviesRepository = new PopularMovies();

  @override
  void test() {
    _interactor = null;
  }

  PopularMoviesInteractor(this._interactor) : super(_interactor);

  void getPopularMovies() async {
    BaseResponse<Movie> movies = await _moviesRepository.getPopularMovies();
    _interactor.getPopularMovies(movies.result);
  }
}

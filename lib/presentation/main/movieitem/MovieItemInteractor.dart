import 'package:logopeds_movies/MVP/MVPRepository.dart';
import 'package:logopeds_movies/networking/api/MoviesApi.dart';
import 'package:logopeds_movies/networking/repository/MoviesApi.dart';
import 'package:logopeds_movies/presentation/main/movieitem/MovieItemIInteractor.dart';
import 'package:logopeds_movies/presentation/main/movieitem/MovieItemPresenter.dart';

class MovieItemInteractor extends MVPRepository<MovieItemIInteractor> {
  IMoviesApi _moviesRepository = new MoviesApi();

  MovieItemInteractor(MovieItemPresenter presenter) : super(presenter);
}

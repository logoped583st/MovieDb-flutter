import 'package:logopeds_movies/MVP/MVPInteractor.dart';
import 'package:logopeds_movies/networking/repository/PopularMoviesApi.dart';
import 'package:logopeds_movies/presentation/main/movieitem/MovieItemIInteractor.dart';
import 'package:logopeds_movies/presentation/main/movieitem/MovieItemPresenter.dart';

class MovieItemInteractor extends MVPInteractor<MovieItemIInteractor> {
  MoviesRepository _moviesRepository = new PopularMovies();

  MovieItemInteractor(MovieItemPresenter presenter) : super(presenter);
}

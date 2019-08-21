import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesRepository.dart';
import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesPresenter.dart';
import 'package:logopeds_movies/presentation/basemovieslist/MoviesView.dart';
import 'package:logopeds_movies/presentation/main/popularmovies/PopularMoviesRepository.dart';


class PopularMoviesPresenter extends BaseMoviesPresenter {

  PopularMoviesPresenter(MoviesView baseView) : super(baseView);

  @override
  BaseMoviesRepository createRepository() {
    return PopularMoviesRepository(this);
  }

}

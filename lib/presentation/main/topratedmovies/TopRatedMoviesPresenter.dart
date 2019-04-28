import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesInteractor.dart';
import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesPresenter.dart';
import 'package:logopeds_movies/presentation/basemovieslist/MoviesView.dart';
import 'package:logopeds_movies/presentation/main/topratedmovies/TopRatedMoviesInteractor.dart';

class TopRatedMoviesPresenter extends BaseMoviesPresenter {

  TopRatedMoviesPresenter(MoviesView baseView) : super(baseView) {
    requestMovies();
  }

  void requestMovies() {
    addToCancelable(getInteractor().loadMovies());
  }

  @override
  BaseMoviesInteractor createInteractor() {
    return TopRatedMoviesInteractor(this);
  }
}

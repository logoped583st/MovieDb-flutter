import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesPresenter.dart';
import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesRepository.dart';
import 'package:logopeds_movies/presentation/basemovieslist/MoviesView.dart';
import 'package:logopeds_movies/presentation/main/topratedmovies/TopRatedMoviesInteractor.dart';

class TopRatedMoviesPresenter extends BaseMoviesPresenter {

  TopRatedMoviesPresenter(MoviesView baseView) : super(baseView);

  @override
  BaseMoviesRepository createRepository() {
    return TopRatedMoviesRepository(this);
  }

}

import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesPresenter.dart';
import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesWidget.dart';
import 'package:logopeds_movies/presentation/basemovieslist/MoviesView.dart';
import 'package:logopeds_movies/presentation/main/topratedmovies/TopRatedMoviesPresenter.dart';

class TopRatedMoviesPage extends BaseMoviesPage {
  @override
  TopRatedMoviesWidget createState() {
    return new TopRatedMoviesWidget();
  }
}

class TopRatedMoviesWidget extends BaseMoviesWidget implements MoviesView {

  @override
  BaseMoviesPresenter createPresenter() => TopRatedMoviesPresenter(this);

}

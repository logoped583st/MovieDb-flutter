import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesPresenter.dart';
import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesWidget.dart';
import 'package:logopeds_movies/presentation/main/popularmovies/PopularMoviesPresenter.dart';
import 'package:logopeds_movies/presentation/main/popularmovies/PopularMoviesView.dart';

class PopularMoviesPage extends BaseMoviesPage {
  @override
  PopularMoviesWidget createState() {
    return new PopularMoviesWidget();
  }
}

class PopularMoviesWidget extends BaseMoviesWidget implements MoviesView {

  @override
  BaseMoviesPresenter createPresenter() => PopularMoviesPresenter(this);

}

import 'package:logopeds_movies/MVP/MVPPresenter.dart';
import 'package:logopeds_movies/pojo/Movie.dart';

import 'MovieItemIInteractor.dart';
import 'MovieItemInteractor.dart';
import 'MovieItemView.dart';

class MovieItemPresenter
    extends MVPPresenter<MovieItemView, MovieItemInteractor>
    implements MovieItemIInteractor {
  final List<Movie> _movies = List();

  List<Movie> getMovies() => _movies;

  MovieItemPresenter(MovieItemView baseView) : super(baseView) {}

  @override
  MovieItemInteractor createInteractor() {
    return MovieItemInteractor(this);
  }
}

import 'package:flutter/foundation.dart';
import 'package:logopeds_movies/MVP/MVPPresenter.dart';
import 'package:logopeds_movies/pojo/Movie.dart';

import 'PopularMoviesIInteractor.dart';
import 'PopularMoviesInteractor.dart';
import 'PopularMoviesView.dart';

class PopularMoviesPresenter
    extends MVPPresenter<PopularMoviesView, PopularMoviesInteractor>
    implements PopularMoviesIInteractor {
  final List<Movie> _movies = List();

  List<Movie> getMovies() => _movies;

  PopularMoviesPresenter(PopularMoviesView baseView) : super(baseView) {
    getInteractor().getPopularMovies();
  }

  @override
  PopularMoviesInteractor createInteractor() {
    return PopularMoviesInteractor(this);
  }




  @override
  void getPopularMovies(List<Movie> movies) {
    _movies.addAll(movies);
    debugPrint(_movies[0].poster);
    getView().onMoviesLoaded(_movies);
  }

}

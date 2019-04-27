import 'package:flutter/widgets.dart';
import 'package:logopeds_movies/MVP/MVPPresenter.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesIInteractor.dart';
import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesInteractor.dart';
import 'package:logopeds_movies/presentation/main/popularmovies/PopularMoviesView.dart';

abstract class BaseMoviesPresenter
    extends MVPPresenter<MoviesView, BaseMoviesInteractor>
    implements BaseMoviesIInteractor {
  final List<Movie> _movies = List();

  List<Movie> getMovies() => _movies;

  bool isLoading = true;

  BaseMoviesPresenter(MoviesView baseView) : super(baseView) {
    requestMovies();
  }

  void listenScroll(ScrollController scrollController) {
    scrollController.addListener(() {
      debugPrint(
          " ${scrollController.position.pixels}  ${scrollController.position.maxScrollExtent}");
      if (scrollController.offset >
          scrollController.position.maxScrollExtent % 2) {
        if (!isLoading) {
          isLoading = !isLoading;
          requestMovies();
        }
      }
    });
  }

  void requestMovies() {
    addToCancelable(getInteractor().loadMovies());
  }

  @override
  void networkMovies(List<Movie> movies) {
    _movies.addAll(movies);
    isLoading = false;
    getView().onMoviesLoaded(_movies);
  }
}

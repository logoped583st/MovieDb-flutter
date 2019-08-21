import 'package:flutter/widgets.dart';
import 'package:logopeds_movies/MVP/MVPPresenter.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:logopeds_movies/presentation/basemovieslist/IBaseMoviesRepository.dart';
import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesRepository.dart';
import 'package:logopeds_movies/presentation/basemovieslist/MoviesView.dart';

abstract class BaseMoviesPresenter
    extends MVPPresenter<MoviesView, BaseMoviesRepository>
    implements IBaseMoviesRepository {
  final List<Movie> _movies = List();

  List<Movie> getMovies() => _movies;

  bool isLoading = true;

  BaseMoviesPresenter(MoviesView baseView) : super(baseView) {
    requestMovies();
  }

  void listenScroll(ScrollController scrollController) {
    scrollController.addListener(() {
      if (scrollController.offset >
          scrollController.position.maxScrollExtent % 1.3) {
        if (!isLoading) {
          isLoading = !isLoading;
          requestMovies();
        }
      }
    });
  }

  bool isListLoading() {
    return isLoading && _movies.isEmpty;
  }

  @override
  void presenterDestroy() {
    isLoading = false;
    super.presenterDestroy();
  }

  void requestMovies() {
    addToCancelable(getRepository().loadMovies());
  }

  @override
  void networkMovies(List<Movie> movies) {
    _movies.addAll(movies);
    isLoading = false;
    getView().onMoviesLoaded(_movies);
  }

  @override
  void databaseMovies(List<Movie> movies) {
    _movies.addAll(movies);
    getView().onMoviesLoaded(_movies);
  }
}

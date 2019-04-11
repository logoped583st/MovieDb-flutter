import 'package:flutter/widgets.dart';
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

  bool isLoading = true;

  PopularMoviesPresenter(PopularMoviesView baseView) : super(baseView) {
    requestMovies();
  }

  void listenScroll(ScrollController scrollController) {
    scrollController.addListener(() {
      debugPrint(" ${scrollController.position.pixels}  ${scrollController.position.maxScrollExtent}");
      if (scrollController.offset  > scrollController.position.maxScrollExtent%2) {
        if (!isLoading) {
          isLoading = !isLoading;
          requestMovies();
        }
      }
    });
  }

  void requestMovies() {
    addToCancelable(getInteractor().getPopularMovies());
  }

  @override
  PopularMoviesInteractor createInteractor() {
    return PopularMoviesInteractor(this);
  }

  @override
  void getPopularMovies(List<Movie> movies) {
    _movies.addAll(movies);
    isLoading = false;
    getView().onMoviesLoaded(_movies);
  }
}

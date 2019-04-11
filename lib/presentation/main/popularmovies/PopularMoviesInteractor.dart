import 'dart:async';

import 'package:logopeds_movies/MVP/MVPInteractor.dart';
import 'package:logopeds_movies/networking/repository/PopularMoviesApi.dart';
import 'package:logopeds_movies/pojo/BaseResponse.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:logopeds_movies/presentation/main/popularmovies/PopularMoviesIInteractor.dart';
import 'package:logopeds_movies/presentation/main/popularmovies/PopularMoviesPresenter.dart';

class PopularMoviesInteractor extends MVPInteractor<PopularMoviesIInteractor> {
  int _page = 1;
  PopularMoviesRepository _moviesRepository = new PopularMovies();

  PopularMoviesInteractor(PopularMoviesPresenter presenter) : super(presenter);

  Future<BaseResponse<Movie>> getPopularMovies() async {
    Future<BaseResponse<Movie>> future = _moviesRepository.getPopularMovies(_page.toString());
    _page++;
    BaseResponse<Movie> movies = await future;
    presenter().getPopularMovies(movies.result);
    return future;
  }
}

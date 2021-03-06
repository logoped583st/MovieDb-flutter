import 'dart:async';

import 'package:logopeds_movies/pojo/BaseResponse.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesRepository.dart';
import 'package:logopeds_movies/presentation/main/topratedmovies/TopRatedMoviesPresenter.dart';


class TopRatedMoviesRepository extends BaseMoviesRepository {
  TopRatedMoviesRepository(TopRatedMoviesPresenter presenter)
      : super(presenter);

  @override
  Future<BaseResponse<Movie>> movieRequest() {
    return moviesApi.getTopRatedMovies(getPage().toString());
  }

  @override
  Future<List<Movie>> getMoviesFromDb() {
    return movieDao.getTopRatedMovies();
  }

  @override
  Future<void> insertMovies(List<Movie> movies) {
    return movieDao.insertTopRatedMovies(movies);
  }
}

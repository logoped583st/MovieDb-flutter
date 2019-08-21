import 'dart:async';

import 'package:logopeds_movies/pojo/BaseResponse.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesRepository.dart';
import 'package:logopeds_movies/presentation/main/popularmovies/PopularMoviesPresenter.dart';

class PopularMoviesRepository extends BaseMoviesRepository {
  PopularMoviesRepository(PopularMoviesPresenter presenter) : super(presenter);

  @override
  Future<BaseResponse<Movie>> movieRequest() {
    return moviesApi.getPopularMovies(getPage().toString());
  }

  @override
  Future<List<Movie>> getMoviesFromDb() {
    return movieDao.getPopularMovies();
  }

  @override
  Future<void> insertMovies(List<Movie> movies) {
    return movieDao.insertPopularMovies(movies);
  }
}

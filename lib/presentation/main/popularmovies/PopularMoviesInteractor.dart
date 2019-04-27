import 'dart:async';

import 'package:logopeds_movies/pojo/BaseResponse.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesInteractor.dart';
import 'package:logopeds_movies/presentation/main/popularmovies/PopularMoviesPresenter.dart';

class PopularMoviesInteractor extends BaseMoviesInteractor {
  PopularMoviesInteractor(PopularMoviesPresenter presenter) : super(presenter);

  @override
  Future<BaseResponse<Movie>> movieRequest() {
    return getRepository().getPopularMovies(getPage().toString());
  }
}

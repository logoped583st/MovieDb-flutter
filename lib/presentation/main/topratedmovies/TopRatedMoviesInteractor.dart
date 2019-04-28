import 'dart:async';

import 'package:logopeds_movies/pojo/BaseResponse.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesInteractor.dart';
import 'package:logopeds_movies/presentation/main/topratedmovies/TopRatedMoviesPresenter.dart';


class TopRatedMoviesInteractor extends BaseMoviesInteractor {
  TopRatedMoviesInteractor(TopRatedMoviesPresenter presenter) : super(presenter);

  @override
  Future<BaseResponse<Movie>> movieRequest() {
    return getRepository().getTopRatedMovies(getPage().toString());
  }
}

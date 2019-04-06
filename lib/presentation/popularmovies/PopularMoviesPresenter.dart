import 'package:flutter/foundation.dart';
import 'package:logopeds_movies/MVP/MVPPresenter.dart';
import 'package:logopeds_movies/networking/repository/PopularMoviesApi.dart';
import 'package:logopeds_movies/pojo/BaseResponse.dart';
import 'package:logopeds_movies/pojo/Movie.dart';

import 'PopularMoviesIInteractor.dart';
import 'PopularMoviesInteractor.dart';
import 'PopularMoviesView.dart';

class PopularMoviesPresenter
    extends MVPPresenter<PopularMoviesView, PopularMoviesInteractor>
    implements PopularMoviesIInteractor {
  PopularMoviesPresenter(PopularMoviesView baseView) : super(baseView) {
    test();
  }

  void test() async {
    PopularMoviesRepository rep = new PopularMovies();

    BaseResponse<Movie> res = await rep.getPopularMovies();
    debugPrint(res.result.toString());
  }

  @override
  PopularMoviesInteractor createInteractor() {
    return PopularMoviesInteractor(this);
  }
}

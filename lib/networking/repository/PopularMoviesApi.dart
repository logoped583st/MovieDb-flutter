import 'dart:async';
import 'dart:convert';

import 'package:logopeds_movies/pojo/BaseResponse.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:logopeds_movies/utils/BaseHttp.dart';

class PopularMovies implements PopularMoviesRepository {
  @override
  Future<BaseResponse<Movie>> getPopularMovies(String page) async {
    final response = await baseGet("/movie/popular",query: {"page":page});
    return BaseResponse<Movie>.fromJson(json.decode(response.body));
  }
}

abstract class PopularMoviesRepository {
  Future<BaseResponse<Movie>> getPopularMovies(String page);
}

import 'dart:async';
import 'dart:convert';

import 'package:logopeds_movies/pojo/BaseResponse.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:logopeds_movies/utils/BaseHttp.dart';

class PopularMovies implements MoviesRepository {
  @override
  Future<BaseResponse<Movie>> getPopularMovies(String page) async {
    final response = await baseGet("/movie/popular", query: {"page": page});
    return BaseResponse<Movie>.fromJson(json.decode(response.body));
  }

  @override
  Future<BaseResponse<Movie>> getTopRatedMovies(String page) async {
    final response = await baseGet("/movie/top_rated", query: {"page": page});
    return BaseResponse<Movie>.fromJson(json.decode(response.body));
  }

  @override
  Future<BaseResponse<Movie>> getUpcomingMovies(String page) async {
    final response = await baseGet("/movie/upcoming", query: {"page": page});
    return BaseResponse<Movie>.fromJson(json.decode(response.body));
  }
}

abstract class MoviesRepository {
  Future<BaseResponse<Movie>> getPopularMovies(String page);

  Future<BaseResponse<Movie>> getTopRatedMovies(String page);

  Future<BaseResponse<Movie>> getUpcomingMovies(String page);
}

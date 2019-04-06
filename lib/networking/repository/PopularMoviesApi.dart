import '../../pojo/BaseResponse.dart';
import '../../pojo/Movie.dart';
import '../../utils/BaseHttp.dart';
import 'dart:async';
import 'dart:convert';

class PopularMovies implements PopularMoviesRepository {
  @override
  Future<BaseResponse<Movie>> getPopularMovies() async {
    final response = await baseGet("/movie/popular");
    return BaseResponse<Movie>.fromJson(json.decode(response.body));
  }
}

abstract class PopularMoviesRepository {
  Future<BaseResponse<Movie>> getPopularMovies();
}

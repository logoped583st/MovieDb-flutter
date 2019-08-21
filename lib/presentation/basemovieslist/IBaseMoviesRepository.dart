import 'package:logopeds_movies/MVP/MVPIRepository.dart';
import 'package:logopeds_movies/pojo/Movie.dart';

abstract class IBaseMoviesRepository implements MVPIRepository{

  void networkMovies(List<Movie> movies);

  void databaseMovies(List<Movie> movies);
}
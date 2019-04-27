import 'package:logopeds_movies/MVP/MVPIInteractor.dart';
import 'package:logopeds_movies/pojo/Movie.dart';

abstract class BaseMoviesIInteractor implements MVPIInteractor{

  void networkMovies(List<Movie> movies);
}
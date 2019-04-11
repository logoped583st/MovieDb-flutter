import 'package:logopeds_movies/MVP/MVPIInteractor.dart';
import 'package:logopeds_movies/pojo/Movie.dart';

abstract class PopularMoviesIInteractor implements MVPIInteractor{

  void getPopularMovies(List<Movie> movies);
}
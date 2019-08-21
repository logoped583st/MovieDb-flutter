import 'package:logopeds_movies/MVP/MVPIView.dart';
import 'package:logopeds_movies/pojo/Movie.dart';

abstract class MoviesView implements MVPIView {
  void onMoviesLoaded(List<Movie> movies);
}

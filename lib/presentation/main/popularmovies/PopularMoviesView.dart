import 'package:logopeds_movies/MVP/MVPIView.dart';
import 'package:logopeds_movies/pojo/Movie.dart';


abstract class PopularMoviesView implements MVPIView {

  void onMoviesLoaded(List<Movie> movies);
}

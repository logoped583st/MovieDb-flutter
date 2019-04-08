import 'package:logopeds_movies/pojo/Movie.dart';

import '../../MVP/MVPIView.dart';

abstract class PopularMoviesView implements MVPIView {

  void onMoviesLoaded(List<Movie> movies);
}

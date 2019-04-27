import 'package:flutter/material.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:logopeds_movies/presentation/main/popularmovies/PopularMoviesView.dart';

class MovieItemPage extends StatefulWidget {
  @override
  MovieItemWidget createState() {
    return new MovieItemWidget();
  }
}

class MovieItemWidget extends State<MovieItemPage>
    implements MoviesView {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {}

  @override
  void onMoviesLoaded(List<Movie> movies) {
    setState(() {});
  }
}

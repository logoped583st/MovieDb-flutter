import 'package:flutter/material.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:logopeds_movies/presentation/basemovieslist/MoviesView.dart';
import 'package:logopeds_movies/utils/ImageHelper.dart';

class MovieItemPage extends StatefulWidget {
  final Movie movie;

  MovieItemPage(this.movie);

  @override
  MovieItemWidget createState() {
    return new MovieItemWidget(movie);
  }
}

class MovieItemWidget extends State<MovieItemPage> implements MoviesView {
  final Movie movie;

  MovieItemWidget(this.movie);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // These are the slivers that show up in the "outer" scroll view.
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverAppBar(
                expandedHeight: 300.0,
                pinned: true,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                    title: Hero(
                        tag: movie,
                        child: Material(
                            color: Colors.transparent,
                            child: Text(movie.title))),
                    background: Material(
                        color: Colors.transparent,
                        child: Hero(
                            tag: movie.poster,
                            child: Container(
                                decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                        fit: BoxFit.cover,
                                        image: new NetworkImage(
                                            getImageUrl(movie.poster)))))))),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(top: 86,left: 16,right: 16),
          child: Container(
              child: Material(child: Text(movie.overview)), color: Colors.redAccent),
        ),
      ),
    );
  }

  @override
  void onMoviesLoaded(List<Movie> movies) {
    setState(() {});
  }
}

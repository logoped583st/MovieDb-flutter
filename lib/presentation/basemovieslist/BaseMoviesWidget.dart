import 'package:flutter/material.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:logopeds_movies/presentation/basemovieslist/BaseMoviesPresenter.dart';
import 'package:logopeds_movies/presentation/basemovieslist/MoviesView.dart';
import 'package:logopeds_movies/statelesswindgets/MovieCard.dart';

abstract class BaseMoviesPage extends StatefulWidget {}

abstract class BaseMoviesWidget extends State<BaseMoviesPage>
    implements MoviesView {
  BaseMoviesWidget() {
    _presenter = createPresenter();
  }

  BaseMoviesPresenter createPresenter();

  BaseMoviesPresenter _presenter;

  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    _presenter.listenScroll(_scrollController);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _presenter.presenterDestroy();
    _presenter = null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      _presenter.isListLoading() ? LinearProgressIndicator() : Container(),
      ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.all(8),
          itemCount: _presenter.getMovies().length,
          itemBuilder: (context, index) {
            if (_presenter.getMovies().isNotEmpty) {
              Movie item = _presenter.getMovies()[index];
              return MovieItem(item);
            } else {
              return Container();
            }
          })
    ]);
  }

  @override
  void onMoviesLoaded(List<Movie> movies) {
    setState(() {});
  }
}

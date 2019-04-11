import 'package:flutter/material.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:logopeds_movies/presentation/main/popularmovies/PopularMoviesPresenter.dart';
import 'package:logopeds_movies/presentation/main/popularmovies/PopularMoviesView.dart';
import 'package:logopeds_movies/utils/ImageHelper.dart';

class PopularMoviesPage extends StatefulWidget {
  @override
  PopularMoviesWidget createState() {
    return new PopularMoviesWidget();
  }
}

class PopularMoviesWidget extends State<PopularMoviesPage>
    implements PopularMoviesView {
  PopularMoviesPresenter _presenter;
  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    debugPrint("INIT");
    _presenter = new PopularMoviesPresenter(this);
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
    return ListView.builder(
      controller: _scrollController,
        padding: EdgeInsets.all(8),
        itemCount: _presenter.getMovies().length,
        itemBuilder: (context, index) {
          if (_presenter.getMovies().isNotEmpty) {
            return Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 8,
                child: ListTile(
                    contentPadding: EdgeInsets.all(8),
                    dense: true,
                    onTap: () {},
                    subtitle: Text(_presenter.getMovies()[index].overview),
                    title: Text(_presenter.getMovies()[index].title),
                    leading: new Container(
                        width: 68,
                        height: 68,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(getImageUrl(
                                    _presenter.getMovies()[index].poster)))))));
          }
        });
  }

  @override
  void onMoviesLoaded(List<Movie> movies) {
    setState(() {});
  }
}

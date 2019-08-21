import 'package:flutter/material.dart';
import 'package:logopeds_movies/pojo/Movie.dart';
import 'package:logopeds_movies/presentation/main/movieitem/MovieItemWidget.dart';
import 'package:logopeds_movies/utils/ImageHelper.dart';

class MovieItem extends StatelessWidget {
  final Movie _movie;

  const MovieItem(this._movie);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Card(
            clipBehavior: Clip.hardEdge,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 8,
            child: ListTile(
                contentPadding: EdgeInsets.all(8),
                dense: false,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieItemPage(_movie)));
                },
                subtitle: Text(_movie.overview),
                title: Text(_movie.title),
                leading: Hero(
                    transitionOnUserGestures: true,
                    tag: _movie.poster,
                    child: Container(
                        width: 68,
                        height: 68,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    getImageUrl(_movie.poster)))))))));
  }
}

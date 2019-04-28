import 'package:logopeds_movies/utils/Deserialize.dart';

class Movie extends Deserialize {
  final String poster;
  final bool adult;
  final String overview;
  final String releaseDate;
  final List<int> genreIds;
  final int id;
  final String title;
  final String language;
  final String backdropPath;
  final double popularity;
  final int voteCount;
  final bool video;
  final double voteAverage;

  Movie({this.poster,
    this.adult,
    this.overview,
    this.releaseDate,
    this.genreIds,
    this.id,
    this.title,
    this.language,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.video,
    this.voteAverage}) : super();


  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        poster: json['poster_path'],
        adult: json['adult'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        //   genreIds: json['genre_ids'],
        id: json['id'],
        title: json['original_title'],
        language: json['original_language'],
        backdropPath: json['backdrop_path'],
        popularity: json['popularity'],
        voteCount: json['vote_count'],
        video: json['video'],
        /*voteAverage: json['vote_average']!=null?.toDouble()*/);
  }

  Map<String, dynamic> movieToJson() {
    return {
      "id": this.id,
      "poster_path": this.poster,
      "overview": this.overview,
      "original_title": this.title};
  }

  @override
  String toString() {
    return "FILM $title";
  }
}

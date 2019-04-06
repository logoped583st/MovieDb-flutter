import 'package:logopeds_movies/pojo/Movie.dart';

abstract class Deserialize {
  Deserialize();

  factory Deserialize.fromJson(Map<String, dynamic> json, Type type) {
    switch (type) {
      case Movie:
        return Movie.fromJson(json);

      default:
        return null;
    }
  }
}

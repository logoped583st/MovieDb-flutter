import 'package:logopeds_movies/utils/Deserialize.dart';

class BaseResponse<T> {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<T> result;

  BaseResponse({this.page, this.totalResults, this.totalPages, this.result});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;

    List result =
        list.map((i) => Deserialize.fromJson(i, T)).toList().cast<T>();

    return BaseResponse(
        page: json['page'],
        totalResults: json['total_results'],
        totalPages: json['total_pages'],
        result: result);
  }

}

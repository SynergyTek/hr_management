import 'package:meta/meta.dart';

/// APIDataModel class contains all information of each API data in the list
/// and we are mapping the JSON data from our API to our variables using fromJson method of dart.
class APIDataModel {
  final int? id;
  final double? popularity;
  final String? title;
  final String? backPoster;
  final String? poster;
  final String? overview;
  final double? rating;

  APIDataModel({
    required this.id,
    required this.popularity,
    required this.title,
    required this.backPoster,
    required this.poster,
    required this.overview,
    required this.rating,
  });

  APIDataModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"],
        title = json["title"],
        backPoster = json["backdrop_path"],
        poster = json["poster_path"],
        overview = json["overview"],
        rating = json["vote_average"].toDouble();
}

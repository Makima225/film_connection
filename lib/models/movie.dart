import 'dart:convert';

import 'package:film_connection/models/app_config.dart';
import 'package:get_it/get_it.dart';

class Movie {
  final String name;
  final String language;
  final bool isAdult;
  final String description;
  final String posterPath;
  final String backdropPath;
  final num rating;
  final String releaseDate;

  Movie(
      {required this.name,
      required this.language,
      required this.isAdult,
      required this.description,
      required this.posterPath,
      required this.backdropPath,
      required this.rating,
      required this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> _json) {
    return Movie(
        name: _json['title'],
        language: _json['original_title'],
        isAdult: _json['adult'],
        description: _json['overview'],
        posterPath: _json['poster_path'],
        backdropPath: _json['backdrop_path'],
        rating: _json['rating'],
        releaseDate: _json['release_date']);
  }

  String posterURL() {
    final AppConfig _appConfig = GetIt.instance.get<AppConfig>();
    return '${_appConfig.BASE_IMAGE_API_URL}${this.posterPath}';
  }
}

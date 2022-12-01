// To parse this JSON data, do
//
//     final reqRespListado = reqRespListadoFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'movie.dart';

class ReqRespListado {
  ReqRespListado({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Dates dates;
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory ReqRespListado.fromJson(String str) =>
      ReqRespListado.fromMap(json.decode(str));

  factory ReqRespListado.fromMap(Map<String, dynamic> json) => ReqRespListado(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });

  DateTime maximum;
  DateTime minimum;

  factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

  factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );
}

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/now_playing_response.dart';

import '../models/movie.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '098b976e614662f5a3dde592a987dcc9';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'en-US';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print('MoviesProvider inicializando');

    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners(); // le dice a los widgets que estan escuchando que se redibujen
  }
}

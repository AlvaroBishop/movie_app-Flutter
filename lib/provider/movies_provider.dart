import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/now_playing_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '098b976e614662f5a3dde592a987dcc9';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'en-US';

  MoviesProvider() {
    print('MoviesProvider inicializando');

    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final nowPlayingResponse = ReqRespListado.fromJson(response.body);

    print(nowPlayingResponse.results[0].title);
  }
}

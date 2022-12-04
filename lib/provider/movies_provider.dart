import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/now_playing_response.dart';
import 'package:movie_app/models/popular_response.dart';

import '../models/movie.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '098b976e614662f5a3dde592a987dcc9';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'en-US';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  int _popularPage = 0;

  MoviesProvider() {

    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData( String endpoint, [ int page = 1] ) async{
    var url = Uri.https(_baseUrl, '3/movie/$endpoint', {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });

    final response = await http.get(url);
    return response.body;
    
  }

  getOnDisplayMovies() async {
    final jsonData = await this._getJsonData('now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners(); // le dice a los widgets que estan escuchando que se redibujen
  }

  getPopularMovies() async {
    _popularPage ++;
    final jsonData = await this._getJsonData('popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }
}

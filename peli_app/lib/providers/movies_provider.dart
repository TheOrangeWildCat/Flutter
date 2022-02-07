import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peli_app/helpers/debouncer.dart';
import 'package:peli_app/models/models.dart';
import 'package:peli_app/models/search_movie_response.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = 'e1633b74ab93182d356694d68a53abb9';
  final String _language = 'es-ES';

  //
  List<Movie> displayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  //
  int _popularPage = 1;

  final debouncer = Debouncer(duration: Duration(milliseconds: 500));

  final StreamController<List<Movie>> _suggestionStreamContoller =
      new StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream =>
      this._suggestionStreamContoller.stream;
  //
  MoviesProvider() {
    print('Provider Movies iniciado');

    getOnDisplayMovies();
    getPopularMovies();
    //_suggestionsSttreamController.close();
  }

  Future<String> _getJsonData(String endPoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endPoint, {
      //
      'api_key': _apiKey,
      'language': _language,
      'page': '$page' //
    });
    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    //print(nowPlayingResponse.results[1].title); //! mapear de manera eficiente
    displayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;
    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    //print(nowPlayingResponse.results[1].title); //! mapear de manera eficiente
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  // getMovieCast(int movieId) async {
  //   final jsonData = await _getJsonData('3/movie/$movieId/credits');
  //   final creditsResponse = CreditsResponse.fromJson(jsonData);
  //   moviesCast[movieId] = creditsResponse.cast;
  //   notifyListeners();

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovie(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie', {
      //
      'api_key': _apiKey,
      'language': _language,
      'query': query //
    });
    final response = await http.get(url);
    final searchMovieResponse = SearchMovieResponse.fromJson(response.body);
    return searchMovieResponse.results;
  }

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      // print('tenemos valor a buscar $value');
      final results = await searchMovie(value);
      this._suggestionStreamContoller.add(results);
    };
    final timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });
    Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel());
  }
}

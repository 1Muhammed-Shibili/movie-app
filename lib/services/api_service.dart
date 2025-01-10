import 'dart:convert';
import 'package:movie_app/models/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://api.tvmaze.com';

  static Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/search/shows?q=all'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data.map<Movie>((json) => Movie.fromJson(json['show'])).toList();
    }
    throw Exception('Failed to fetch movies');
  }

  static Future<List<Movie>> searchMovies(String query) async {
    final response =
        await http.get(Uri.parse('$baseUrl/search/shows?q=$query'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data.map<Movie>((json) => Movie.fromJson(json['show'])).toList();
    }
    throw Exception('Failed to search movies');
  }
}

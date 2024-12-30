import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/joke_model.dart';

class JokeService {
  static const String _cacheKey = 'cached_jokes';

  Future<List<Joke>> fetchJokes() async {
    final url =
        Uri.parse('https://v2.jokeapi.dev/joke/Any?type=single&amount=5');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['jokes'];
      final jokes = data.map((j) => Joke.fromJson(j)).toList();

      await _cacheJokes(jokes);
      return jokes;
    } else {
      throw Exception('Failed to fetch jokes');
    }
  }

  Future<List<Joke>> getCachedJokes() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedJokes = prefs.getString(_cacheKey);

    if (cachedJokes != null) {
      final List<dynamic> data = jsonDecode(cachedJokes);
      return data.map((j) => Joke.fromJson(j)).toList();
    } else {
      return [];
    }
  }

  Future<void> _cacheJokes(List<Joke> jokes) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_cacheKey, jsonEncode(jokes));
  }
}

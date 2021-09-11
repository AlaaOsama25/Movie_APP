
import 'dart:convert';

import 'package:movie_app/model/movies.dart';
import 'package:http/http.dart' as http;

Future<Movies> PopularMovies(int page) async {
  final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=833625f97c364f355b022e6ef194a3a6&language=en-US&page=${page}'));

  if(response.statusCode==200){
    //print(response.body);
    return Movies.fromJson(jsonDecode(response.body));
  }
  else
    {
      throw Exception('failed to get popular Movies data');
    }
}

Future<Movies> TopRatedMovies(int page) async {
  final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=833625f97c364f355b022e6ef194a3a6&language=en-US&page=${page}'));

  if(response.statusCode==200){
   // print(response.body);
    return Movies.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to get Top Rated Movies data');
  }
}

Future<Movies> NowPlayingMovies(int page) async {
  final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=833625f97c364f355b022e6ef194a3a6&language=en-US&page=${page}'));

  if(response.statusCode==200){
   // print(response.body);
    return Movies.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to get Now Playing Movies data');
  }
}
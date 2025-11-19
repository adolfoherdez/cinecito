import 'package:cinecito/config/constants/environment.dart';
import 'package:cinecito/domain/datasources/movies_datasources.dart';
import 'package:cinecito/domain/entities/movie.dart';
import 'package:cinecito/infrastructure/mappers/movie_mapper.dart';
import 'package:cinecito/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasources extends MoviesDatasources{
  final dio=Dio(
    BaseOptions(
      baseUrl: Environment.thebaseUrl,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${Environment.key}',
      },
      queryParameters: {'language':'es-MX'},
      ),
  );
  
  List<Movie> _jsonToMovie(Map<String, dynamic> json){
    final response = MovieDbResponse.fromJson(json);
    final List<Movie> movies = response.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToMovieEntity(moviedb))
        .toList();
    
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page':page}
    );
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    
    final List<Movie> movies = movieDBResponse.results
      .where((moviedb) => moviedb.posterPath != 'no-poster')
      .map((moviedb) => MovieMapper.movieDBToMovieEntity(moviedb))
      .toList();

    return movies;
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
        final response = await dio.get(
      '/movie/getPopular',
      queryParameters: {'page':page}
    );
    return _jsonToMovie(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
        final response = await dio.get(
      '/movie/getTopRated',
      queryParameters: {'page':page}
    );
    return _jsonToMovie(response.data);
  }
  
  @override
  Future<List<Movie>> getUpcomming({int page = 1}) async {
        final response = await dio.get(
      '/movie/getUpcomming',
      queryParameters: {'page':page}
    );
    return _jsonToMovie(response.data);
  }
}
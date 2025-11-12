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
      queryParameters: {'api_key': Environment.key, 'language':'es-MX'},
      ),
  );
  @override
  Future<List<Map<String,dynamic>>> getNowPlaying({int page=1})async{
      final response = await dio.get('/movie/now_Playing');
      final movieDBResponse = MovieDbResponse.fromJson(response.data);
      final List<Movie> movies = movieDBResponse.results.where(
        (moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToMovieEntity(moviedb))
        .toList();
      return List<Map<String,dynamic>>.from(response.data['results']);
  }
}
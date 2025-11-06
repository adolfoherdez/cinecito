import 'package:cinecito/domain/entities/movie.dart';

abstract class MoviesRepositories {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
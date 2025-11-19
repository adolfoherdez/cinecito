import 'package:cinecito/domain/datasources/movies_datasources.dart';
import 'package:cinecito/domain/entities/movie.dart';
import 'package:cinecito/domain/repositories/movies_repositories.dart';

class MoviesRepositoryImpl extends MoviesRepositories{
  final MoviesDatasources datasource;

  MoviesRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page=1}){
    return datasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page=1}){
    return datasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page=1}){
    return datasource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcomming({int page=1}){
    return datasource.getUpcomming(page: page);
  }
}
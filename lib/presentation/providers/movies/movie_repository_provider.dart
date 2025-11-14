import 'package:cinecito/domain/repositories/movies_repositories.dart';
import 'package:cinecito/infrastructure/datasources/moviedb_datasources.dart';
import 'package:cinecito/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesRepositoryProvider = Provider((ref) {
  final MoviesRepositories repository = MoviesRepositoryImpl(MoviedbDatasources());
  return repository;
});
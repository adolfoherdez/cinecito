import 'dart:async';

import 'package:cinecito/domain/entities/movie.dart';

abstract class MoviesDatasources {
  Future<List<Movie>>getNowPlaying({int page = 1});
}
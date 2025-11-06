import 'dart:async';

abstract class MoviesDatasources {
  Future<List<Map<String, dynamic>>>
  getNowPlaying({int page = 1});
}
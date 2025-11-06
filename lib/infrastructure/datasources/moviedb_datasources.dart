import 'package:cinecito/config/constants/environment.dart';
import 'package:cinecito/domain/datasources/movies_datasources.dart';
import 'package:dio/dio.dart';

class MoviedbDatasources extends MoviesDatasources{
  final dio=Dio(
    BaseOptions(
      baseUrl: Environment.thebaseUrl,
      queryParameters: {'api_key': Environment.key, 'language':'es-MX'},
      ),
  );
  @override
  Future<List<Map<String,dynamic>>> getNowPlaying({int page=1}){
    final response = await dio.get('movie/nowPlaying');
    final moviedbResponse = response.data;
  }
}
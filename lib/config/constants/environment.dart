import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment{
  static String key = dotenv.env['TOKEN_SECRET_TMDB'] ?? 'your_api_key';
  static String thebaseUrl = dotenv.env['API_TMDB'] ?? 'https://api.themoviedb.org/3';
}
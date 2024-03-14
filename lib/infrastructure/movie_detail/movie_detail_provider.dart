import 'package:dio/dio.dart';
import 'package:movie_app/domain/cast_response.dart';

import 'package:movie_app/domain/models/movie_details_response.dart';

class MovieDetailProvider {
  final dio = Dio();
  Future<MovieDetails> loadMovieDetails({required int id}) async {
    Response response = await dio.get('https://api.tvmaze.com/shows/$id');
    switch (response.statusCode) {
      case 200:
        return MovieDetails.fromJson(response.data);
      default:
        throw Exception('error');
    }
  }

  //=-=-=-= Load Cast =-=-=-=-=-
    Future<List<CastResponse>> loadCast(int id) async {
    Response response = await dio.get('https://api.tvmaze.com/shows/$id/cast');
    switch (response.statusCode) {
      case 200:
        return List<CastResponse>.from(
            response.data.map((e) => CastResponse.fromJson(e))).toList();

      default:
        throw Exception('error');
    }
  }
}

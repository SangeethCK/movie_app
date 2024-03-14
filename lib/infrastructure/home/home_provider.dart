import 'package:dio/dio.dart';

import 'package:movie_app/domain/models/home_response.dart';

class HomeProvider {
  final dio = Dio();
  Future<List<MoviesResponse>> loadHome() async {
    Response response = await dio.get('https://api.tvmaze.com/shows');
    switch (response.statusCode) {
      case 200:
        return List<MoviesResponse>.from(
            response.data.map((e) => MoviesResponse.fromJson(e))).toList();

      default:
        throw Exception('error');
    }
  }

}

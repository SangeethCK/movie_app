import 'package:dio/dio.dart';
import 'package:movie_app/core/config.dart';
import 'base_api.dart';


class TGPYBookApi extends BaseApi {

  TGPYBookApi() {
    BaseOptions options = BaseOptions(
      baseUrl: Config.apiUrl,
      headers: {
      },
    );
    dio = Dio(options);
  }

 
}

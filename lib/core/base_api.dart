import 'dart:developer';

import 'package:dio/dio.dart';

class BaseApi {
  Dio? dio;

  BaseApi() {
    dio = Dio();
  }

  Future get(url, {queryParameters, Map<String, dynamic>? headers}) async {
    try {
      Options options = Options(headers: headers);

      Response response = await dio!
          .get(url, queryParameters: queryParameters, options: options);

      log('status code = ${response.statusCode}\nresponse == ${response.data.toString()}',
          name: url);

      if (response.statusCode == 401) {
        await unAutherized();
      } else {
        return response;
      }
    } on DioException catch (e) {
      log('status code = ${e.response?.statusCode}\nresponse == ${e.response?.data.toString()}',
          name: url);
      if (e.response?.statusCode == 401) {
        await unAutherized();
      }
      if (e.response != null) {
        return e.response;
      } else {
        return null;
      }
    }
  }

  Future post(url,
      {queryParameters, data, Map<String, dynamic>? headers}) async {
    try {
      headers ??= {};
      if (data != null) {
        headers['Content-Type'] = 'application/json';
      }
      Options options = Options(
        headers: headers,
      );

      Response response = await dio!.post(url, data: data, options: options);

      log('status code = ${response.statusCode}\nresponse == ${response.data.toString()}',
          name: url);

      if (response.statusCode == 401) {
        await unAutherized();
      } else {
        return response;
      }
    } on DioException catch (e) {
      log('status code = ${e.response?.statusCode}\nresponse == ${e.response?.data.toString()}',
          name: url);

      if (e.response?.statusCode == 401) {
        await unAutherized();
      }
      if (e.response != null) {
        return e.response;
      } else {
        return null;
      }
    } catch (e, s) {
      log('Exception: $e', stackTrace: s);
    }
  }

  Future patch(url, {data, Map<String, dynamic>? headers}) async {
    try {
      headers ??= {};
      if (data != null) {
        headers['Content-Type'] = 'application/json';
      }

      Options options = Options(
        headers: headers,
      );

      Response response = await dio!.patch(url, data: data, options: options);

      log('status code = ${response.statusCode}\nresponse == ${response.data.toString()}',
          name: url);
      if (response.statusCode == 401) {
        await unAutherized();
      } else {
        return response;
      }
    } on DioException catch (e) {
      log('status code = ${e.response?.statusCode}\nresponse == ${e.response?.data.toString()}',
          name: url);
      if (e.response?.statusCode == 401) {
        await unAutherized();
      }
      if (e.response != null) {
        return e.response;
      } else {
        return null;
      }
    }
  }

  Future put(url,
      {queryParameters, data, Map<String, dynamic>? headers}) async {
    try {
      Options options = Options(headers: headers);
      Response response = await dio!.put(url,
          data: data, queryParameters: queryParameters, options: options);
      if (response.statusCode == 401) {
        await unAutherized();
      } else {
        return response;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await unAutherized();
      }
      if (e.response != null) {
      } else {}
    }
  }

  // Future delete(url, {data, Map<String, dynamic>? headers}) async {
  //   try {
  //     Options options = Options(headers: headers);

  //     Response response = await dio!.delete(url, data: data, options: options);
  //     log('status code = ${response.statusCode}\nresponse == ${response.data.toString()}',
  //         name: url);
  //     if (response.statusCode == 401) {
  //       await unAutherized();
  //     } else {
  //       return response;
  //     }
  //   } on DioException catch (e) {
  //     if (e.response?.statusCode == 401) {
  //       await unAutherized();
  //     } else if (e.response?.statusCode == 400) {
  //       return e.response;
  //     }
  //   }
  // }

  Future delete(url, {data, Map<String, dynamic>? headers}) async {
    try {
      if (dio == null) {
        throw Exception('Dio instance is not initialized');
      }

      Options options = Options(headers: headers);

      Response response = await dio!.delete(url, data: data, options: options);
      log('status code = ${response.statusCode}\nresponse == ${response.data.toString()}',
          name: url);
      if (response.statusCode == 401) {
        await unAutherized();
      } else {
        return response;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await unAutherized();
      } else if (e.response?.statusCode == 400) {
        return e.response;
      }
    }
  }

//?========== Unautherized Access ==========
  Future<void> unAutherized() async {
    // rootScaffoldMessengerKey.currentState!.showSnackBar(
    //     snackBarWidget('Unautherized access. Please login again'));
    // log('Response - Unautherized access');

    // await rootScaffoldMessengerKey.currentState!.context
    //     .read<AuthController>()
    //     .logout()
    //     .then((value) => navigatorKey.currentState?.pushNamedAndRemoveUntil(
    //         LoginView.routeName, ModalRoute.withName(SplashScreen.routeName)));
  }
}

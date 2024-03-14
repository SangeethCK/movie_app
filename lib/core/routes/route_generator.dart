import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/domain/models/movie_details_response.dart';
import 'package:movie_app/prsentation/screens/home/screen_home.dart';
import 'package:movie_app/prsentation/screens/movie_details/movie_details.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case initialRoutes:
        return MaterialPageRoute(builder: (_) => const ScreenHome());

      case movieDetails :
        if (args is MovieDetails) {
          return MaterialPageRoute(builder: (_) => ScreenMovieDetails(id: args.id?.toInt()??0));
        } else {
          return _errorRoute(error: 'Invalid argument type for movie details route');
        }

      default:
        return _errorRoute(error: 'Unknown route: ${settings.name}');
    }
  }

  static Route<dynamic> _errorRoute({String? error}) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Text(
            error ?? 'An error occurred',
            style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}

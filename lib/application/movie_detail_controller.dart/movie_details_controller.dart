import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app/domain/cast_response.dart';
import 'package:movie_app/domain/models/movie_details_response.dart';
import 'package:movie_app/infrastructure/movie_detail/movie_detail_provider.dart';

class MovieDetailController extends ChangeNotifier {
  bool _isLoadCustomer = false;

  bool get isLoadCustomer => _isLoadCustomer;

  set isLoadCustomer(bool isLoadCustomer) {
    _isLoadCustomer = isLoadCustomer;
    notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  //=-=-=-= InitState =-=-=

  initstateOfMovieDetails(int id) async {
   await loadMovieDetails(id: id);
    notifyListeners();
  }

//=-=-=-= Load Home =-=-=-=
  MovieDetails? movieDetail;
  Future<void> loadMovieDetails({required int id}) async {
    try {
      isLoading = true;
      final response = await MovieDetailProvider().loadMovieDetails(id: id);
      if (response.runtimeType == MovieDetails) {
        movieDetail = response;
    
      }
    } catch (e) {
      log('message');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
 //=-=-=-= InitState =-=-=

  initStateCast(int id) async {
   await loadCast( id);
    notifyListeners();
  }
   //=-=-=-= Load Cast =-=-=-=
  List<CastResponse> castList = [];
  Future<void> loadCast(int id) async {
    try {
      isLoading = true;
      final response = await MovieDetailProvider().loadCast(id);
      if (response.isNotEmpty) {
        castList = response;
      }
    } catch (e) {
      log('message');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

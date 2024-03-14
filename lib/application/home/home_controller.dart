import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/home_response.dart';
import 'package:movie_app/infrastructure/home/home_provider.dart';

class HomeController extends ChangeNotifier {
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

//=-=-=-= Load Home =-=-=-=
  List<MoviesResponse> homeList = [];
  Future<void> loadHome() async {
    try {
      isLoading = true;
      final response = await HomeProvider().loadHome();
      if (response.isNotEmpty) {
        homeList = response;
      }
    } catch (e) {
      log('message');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

 
}

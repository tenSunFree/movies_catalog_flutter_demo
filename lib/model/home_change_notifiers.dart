import 'package:flutter/material.dart';
import 'home_response.dart';

class HomeResponseNotifier with ChangeNotifier {
  HomeResponse _response;

  HomeResponseNotifier(HomeResponse response) {
    this._response = response;
  }

  get response => _response;

  set response(HomeResponse response) {
    _response = response;
    notifyListeners();
  }
}

class PageNotifier with ChangeNotifier {
  double _page = 0.0;

  get page => _page;

  set page(double newPage) {
    _page = newPage;
    notifyListeners();
  }
}

class IndexNotifier with ChangeNotifier {
  int _index = 0;

  get index => _index;

  set index(int newIdex) {
    _index = newIdex;
    notifyListeners();
  }
}

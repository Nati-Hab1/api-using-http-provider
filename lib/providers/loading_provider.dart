import 'package:flutter/material.dart';

class LoadingProvider extends ChangeNotifier {
  bool loading;

  LoadingProvider({this.loading = false});

  void changeLoading({required bool value}) {
    loading = value;
    notifyListeners();
  }
}

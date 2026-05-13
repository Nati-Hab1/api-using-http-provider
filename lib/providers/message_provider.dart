import 'package:flutter/material.dart';

class MessageProvider extends ChangeNotifier {
  String message;

  MessageProvider({
    this.message = 'Press a button to make API request',
  });

  void changeMessage({required String newMessage}) {
    message = newMessage;
    notifyListeners();
  }
}

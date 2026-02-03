import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchController extends ChangeNotifier {
  int seconds = 0;
  Timer? _timer;

  void start() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      seconds++;
      notifyListeners();
    });
  }

  void toggle() {
    if (_timer == null) {
      start();
    } else {
      pause();
    }
  }

  void pause() {
    _timer?.cancel();
    _timer = null;
  }

  void reset() {
    pause();
    seconds = 0;
    notifyListeners();
  }

  void finish() {
    pause();
  }

  String get formattedTime {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2,'0')}:${secs.toString().padLeft(2,'0')}';
  }
}

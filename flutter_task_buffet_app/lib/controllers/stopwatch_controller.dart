import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchController extends ChangeNotifier {
  int seconds = 0;
  Timer? _timer;
  bool _isDisposed = false;

  void start() {
    if (_isDisposed) return;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (_isDisposed) return;
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
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  void finish() {
    pause();
  }

  String get formattedTime {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2,'0')}:${secs.toString().padLeft(2,'0')}';
  }

  @override
  void dispose() {
    _isDisposed = true;
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}

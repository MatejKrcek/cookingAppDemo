import 'package:cooking_app/pages/new_screen.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:async';

class TimeProvider with ChangeNotifier {
  Timer? _timer;
  int _currentTime = 10;

  int get currentTime => _currentTime;

  void playSound() {
    final AudioCache _player = AudioCache();
    const alarmAudioPath = "sounds.mp3";
    _player.play(alarmAudioPath);
  }

  void startTimer(context) {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_currentTime == 0) {
          timer.cancel();
          notifyListeners();
          playSound();
        } else if (_currentTime == 5) {
          _currentTime--;
          notifyListeners();
          playSound();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewScreen()),
          );
        } else {
          _currentTime--;
          notifyListeners();
        }
      },
    );
  }
}

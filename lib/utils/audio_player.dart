import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioProvider extends ChangeNotifier {
  late List<AudioPlayer> audioPlayers;
  late List<bool> isPlayingList;

  AudioProvider() {
    audioPlayers = [
      AudioPlayer(),
      AudioPlayer(),
      AudioPlayer(),
    ];

    isPlayingList = [false, false, false];

    for (var i = 0; i < audioPlayers.length; i++) {
      audioPlayers[i].onPlayerStateChanged.listen((PlayerState state) {
        if (state == PlayerState.completed) {
          stopAudio(i);
        }
      });
    }
  }

  void playAudio(int index, String audioPath) async {
    await audioPlayers[index].play(
      AssetSource(audioPath),
      volume: 1.0,
    );
    isPlayingList[index] = true;
    notifyListeners();
  }

  void pauseAudio(int index) {
    audioPlayers[index].pause();
    isPlayingList[index] = false;
    notifyListeners();
  }

  void stopAudio(int index) {
    audioPlayers[index].stop();
    isPlayingList[index] = false;
    notifyListeners();
  }

  bool isPlaying(int index) {
    return isPlayingList[index];
  }
}

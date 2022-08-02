import 'package:clientapp/core/provider/music_player_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PodcastPlayerProvider extends ChangeNotifier {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  final String? path =
      "https://storage.googleapis.com/kin-project-352614-storage/Media_Files/Track_Files/1:%20teddy/1:%20album1/Teddy_Afro_-_Olan_Yizo___%E1%8A%A6%E1%88%8B%E1%8A%95_%E1%8B%AD%E1%8B%9E.mp3";
  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;
  bool isRepeat = false;
  Color playerColor = Colors.black;
  Color repeatColor = Colors.black54;
  Color loopColor = Colors.black54;
  MusicPlayerProvider mP = MusicPlayerProvider();

  getDuration() => _duration;
  getPosition() => _position;

  playPodcast() {
    isPlaying = true;
    mP.isPlaying = false;
  }
}

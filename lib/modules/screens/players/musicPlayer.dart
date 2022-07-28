import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

class MusicPlayerScreen extends StatefulWidget {
  final String musicUrl;
  final bool isAsset;

  MusicPlayerScreen({Key? key, required this.musicUrl, required this.isAsset})
      : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _musicplayer;
  late AudioCache _musicCache;
  PlayerState _playerState = PlayerState.stopped;
  bool get _isPlaying => _playerState == PlayerState.playing;
  bool get _isLocal => !widget.musicUrl.contains('https');
  void initState() {
    // _musicplayer = AudioPlayer(mode:PlayerMode.mediaPlayer);
    // _musicCache = AudioCache(fixedPlayer: _musicplayer);
    //AudioPlayer.l=true;
    _musicplayer.onSeekComplete.listen((msg) {
      // ignore: avoid_print
      print('error: ');
      setState(() {
        _playerState = PlayerState.stopped;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _musicplayer.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Center();
  }
}
//https://www.ethiopianorthodox.org/amharic/sibket/abawtinsae/yekidusmichaelamalaginet01.mp3
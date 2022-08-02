import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

class PodcastPlayerProvider extends ChangeNotifier{
  AssetsAudioPlayer player = AssetsAudioPlayer();

  
  bool _isMusicStopped = true;
  bool _miniPlayerVisibility = false;
  bool get isMusicStopped => _isMusicStopped;
 bool get miniPlayerVisibility => _miniPlayerVisibility;

  void setMusicStopped(bool value){
    _isMusicStopped = value;
    notifyListeners();
  }
  
void setMiniPlayerVisibility(bool visibility) {
    _miniPlayerVisibility = visibility;
    notifyListeners();
  }

  void setPlayer(AssetsAudioPlayer musicPlayer) {
    player = musicPlayer;

    setMiniPlayerVisibility(true);
  }


  late int _sessionId;

  int get sessionId => _sessionId;

  playOrPause() async {
    try {
      await player.playOrPause();
    } catch(_) { }
  }

  play(index) async {
    try {
    //  _currentMusic = _currentAlbum.musics[index];
      notifyListeners();
      await _open();
      //_currentIndex = index;
    } catch(_) { }
  }


  _open() async {

    var metas = Metas(
      title: "singer",
      artist: "teddy",
     // image: MetasImage.network('$apiUrl/${music.cover}'),
      id: "1",

      //can be MetasImage.network //'$apiUrl/${music.audio}',
    );
    try {
      await player.open(
        Audio.network(
          
          "http://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3",
          metas: metas,
        ),
        showNotification: true,
        notificationSettings: NotificationSettings(

          customPlayPauseAction: (player) => playOrPause(),
          customStopAction: (player) {
            setMusicStopped(true);
            player.stop();
            setMiniPlayerVisibility(false);

          },
        ),
      );
    } catch(_) { }
  }


  bool isPlaying() {
    return player.isPlaying.value;
  }

  void audioSessionListener() {
    player.audioSessionId.listen((sessionId) {
      _sessionId = sessionId;
    });
  }


}
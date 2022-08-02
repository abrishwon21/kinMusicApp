import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:clientapp/constants/api_paths.dart';
//import 'package:clientapp/core/services/models/music.dart';
import 'package:clientapp/services/networks/api_services.dart';
import 'package:clientapp/services/networks/models/music.dart';
import 'package:clientapp/services/networks/models/radio.dart';
import 'package:flutter/material.dart';
//import 'package:kin_music_player_app/services/network/model/radio.dart';
//import 'package:kin_music_player_app/services/provider/music_player.dart';
//import 'package:kin_music_player_app/services/provider/podcast_player.dart';

//import '../../constants.dart';
//import '../network/api_service.dart';

class SingleMusicPlayer extends ChangeNotifier {
  AssetsAudioPlayer player = AssetsAudioPlayer();

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool _isPlaying = false;

  Music? _currentMusic;

  Music? get currentMusic => _currentMusic;

  bool get isPlaying => _isPlaying;
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  List<Music> _music = [];

  List<Music> get music => _music;

  final _audios = <Audio>[];

  List<Audio> get audios => _audios;

  bool _miniPlayerVisibility = false;

  bool get miniPlayerVisibility => _miniPlayerVisibility;

  SingleMusicPlayer() {
    AssetsAudioPlayer.addNotificationOpenAction((notification) {
      return true;
    });
  }

  Future<List<Music>> getMusic() async {
    const String apiEndPoint = '/api/track/';

    _music = await getSingleMusicByTrackId(apiEndPoint);


   return music;
  }
  /*
  Future<List<Music>> getSingleMusic() async {
    bool isLoading = false;
    const String apiEndPoint = '/player/?track=1';
    isLoading = true;
    List<Music> singleMusic = await getSingleMusicByTrackId(apiEndPoint);
    isLoading = false;
    notifyListeners();
    return singleMusic;
  }
  */
  void setMiniPlayerVisibility(bool visibility) {
    _miniPlayerVisibility = visibility;
    notifyListeners();
  }

  void setIsPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }

  void setPlayer(AssetsAudioPlayer radioPlayer) {
    player = radioPlayer;
    notifyListeners();
    setMiniPlayerVisibility(true);
   // musicProvider.setMiniPlayerVisibility(false);
    //podcastPlayer.setMiniPlayerVisibility(false);
  }

  setPlaying(Music Music, int index) {
    _currentMusic = Music;
    _currentIndex = index;
  }

  next({action = true}) {
    int next = _currentIndex + 1;
    play(next);
    _isPlaying = true;
    notifyListeners();
  }

  prev() {
    int pre = _currentIndex - 1;
    if (pre <= _music.length) {
      play(pre);
      _isPlaying = true;
      notifyListeners();
    }
  }

  isStationInProgress(Music music) {
    return player.isPlaying.value &&
        player.current.value != null &&
        //  player!.current.value?.audio.assetAudioPath == music.audio;
        player.getCurrentAudioTitle == music.track_name;
  }

  late int tIndex;

  setBuffering(index) {
    tIndex = index;
  }

  bool _isStationLoaded = true;

  bool get isStationLoaded => _isStationLoaded;

  handlePlayButton(index) async {
    setBuffering(index);
    try {
      _isStationLoaded = false;
      notifyListeners();
      _currentIndex = index;
      await _open(music[index]);
      _isStationLoaded = true;
      notifyListeners();
      setPlaying(_music[index], index);
    } catch (_) {
    }
  }

  play(index) async {
    try {
      _currentMusic = _music[index];
      notifyListeners();
      await _open(_music[index]);
      _currentIndex = index;
    } catch (_) {
    }
  }


  _open(Music music) async {
    var metas = Metas(
        title: music.track_name,
        artist: music.artist_name,
       // image: MetasImage.network('$apiUrl/${station.coverImage}')
        );
    try {
      await player.open(
        
        Audio.network(music.track_file, metas: metas),
        showNotification: true,
        notificationSettings: NotificationSettings(
          playPauseEnabled: false,
          customPrevAction: (player) {
            prev();
            setMiniPlayerVisibility(true);

          },
          customNextAction: (player) {
            next();
            setMiniPlayerVisibility(true);
          },
          customStopAction: (player) {
            player.stop();
            setMiniPlayerVisibility(false);
            setIsPlaying(false);
          },
        ),
      );
    }  catch (_) {
    }
  }

  playOrPause() async {
    try {
      await player.playOrPause();
    }  catch (_) {
    }
  }

  isFirstStation() {
    return _currentIndex == 0;
  }

  isLastStation(next) {
    return next == _music.length;
  }
}

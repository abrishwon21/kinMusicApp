import 'package:clientapp/services/networks/api_services.dart';
import 'package:clientapp/services/networks/models/music.dart';
import 'package:flutter/material.dart';
//import 'package:kin_music_player_app/services/network/model/music.dart';

//import '../network/api_service.dart';

class MusicProvider extends ChangeNotifier {
  bool isLoading = false;
  //late int isFavorite;
  List<dynamic> searchedMusics = [];
  Future<List<Music>> getMusics() async {
    const String apiEndPoint = '/musics/recent';
    isLoading = true;
    List<Music> musics = await getMusic(apiEndPoint);

    isLoading = false;
    notifyListeners();
    return musics;
  }

  Future<List<Music>> getSingleMusic(trackid) async {
    bool isLoading = false;
    const String apiEndPoint = '/player/?track=1';
    isLoading = true;
    List<Music> singleMusic = await getSingleMusicByTrackId(apiEndPoint);
    isLoading = false;
    notifyListeners();
    return singleMusic;
  }

  Future<List<Music>> getPopularMusic() async {
    const String apiEndPoint = '/musics/popular';
    isLoading = true;
    List<Music> musics = await getMusic(apiEndPoint);

    isLoading = false;
    notifyListeners();
    return musics;
  }

/*
  Future searchedMusic(keyword) async{
    String apiEndPoint = '/music/search/$keyword';
    isLoading = true;
    searchedMusics = await searchMusic(apiEndPoint);
    isLoading = false;
    notifyListeners();
    return searchedMusics;
  }
*/
}

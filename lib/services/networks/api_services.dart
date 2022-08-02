import 'dart:convert';

import 'package:clientapp/constants/api_paths.dart';
import 'package:clientapp/services/networks/models/music.dart';
import 'package:clientapp/services/networks/models/radio.dart';
import 'package:http/http.dart';

Future<List<RadioStation>> getRadioStations(apiEndPoint) async {
  Response response = await get(Uri.parse("$apiUrl/api" "$apiEndPoint"));

  if (response.statusCode == 200) {
    final item = json.decode(response.body) as List;
    List<RadioStation> stations = item.map((value) {
      return RadioStation.fromJson(value);
    }).toList();

    return stations;
  } else {}
  return [];
}

Future getMusic(apiEndPoint) async {
  Response response = await get(Uri.parse("$kinMusicApiBaseUrl" "$apiEndPoint"));
  if (response.statusCode == 200) {
    final item = json.decode(response.body)['TrackData'] as List;
    List<Music> music = item.map((value) => Music.fromJson(value)).toList();
    return music;
  } else {}
}

Future getSingleMusicByTrackId(apiEndPoint) async {
  Response response =
      await get(Uri.parse("$kinMusicApiBaseUrl" "$apiEndPoint"));
  if (response.statusCode == 200) {
    final musicFile = json.decode(response.body)['results'];
    //const music = musicFile.map((e) => Music.fromJson(e)).toList();
    print(musicFile);
    return musicFile;
  } else {}
}

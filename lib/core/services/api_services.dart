import 'dart:convert';

import 'package:clientapp/constants/api_paths.dart';
import 'package:clientapp/core/services/models/musicProvider.dart';
import 'package:http/http.dart' as http;

Future<List<Music>> getMusics() async {
  var data = await http.get(Uri.parse("$apiUrl/api/track/"));
  var jsonData = json.decode(data.body);
  List<Music> mList = [];
  for (var m in jsonData) {
    Music music = Music(m["track_name"], m["track_file"], m["track_name"]);
    mList.add(music);
  }
  return mList;
}

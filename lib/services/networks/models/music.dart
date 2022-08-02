import 'package:json_annotation/json_annotation.dart';

part 'music.g.dart';

@JsonSerializable()
class Music {
  // final bool isFavourite;
  final int? id;
  final String track_name;
  final String track_description;
  final String track_file;
  final int? artist_id;
  final String? artist_name;
  final int? album_id;
  final String? album_title;
  final String? album_cover;
  final int? genre_id;
  final String? genre_title;
  final int? lyrics_id;
  final String? lyrics_details;


   Music( 
      {
    this.id, required this.track_name,required this.track_description,required this.track_file,
    this.artist_id, this.artist_name,this.album_id,this.album_title,this.album_cover, this.genre_id,
    this.genre_title,this.lyrics_id,this.lyrics_details
    });
    
   
  
  factory Music.fromJson(Map<String, dynamic> json) {
    return _$MusicFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MusicToJson(this);
}

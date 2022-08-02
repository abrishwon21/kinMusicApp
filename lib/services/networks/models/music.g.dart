// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Music _$MusicFromJson(Map<String, dynamic> json) => Music(
       id: json['track_id'] as int,
       track_name: json['track_name'] as String,
       track_description: json['track_description'] as String,
       track_file: json['track_file'] as String,
       artist_id: json['artist_id'] as int,
       artist_name:json['artist_name'] as String,
       album_id: json['album_id'] as int,
       album_title: json['album_title'] as String,
       album_cover: json['album_cover'] as String,
       genre_id: json['genre_id'] as int,
       genre_title: json['genre_title'] as String,
       lyrics_id: json['lyrics_id'] as int,
       lyrics_details: json['lyrics_details'] as String,
      
    );

Map<String, dynamic> _$MusicToJson(Music instance) => <String, dynamic>{
     


      'id':instance.id,
      'track_name':instance.track_name,
      'track_description':instance.track_description,
      'track_file':instance.track_file,
      'artist_id':instance.artist_id,
      'artist_name':instance.artist_name,
      'album_id':instance.album_id,
      'album_title':instance.album_title,
      'album_cover':instance.album_cover,
      'genre_id':instance.genre_id,
      'genre_title':instance.genre_title,
      'lyrics_id':instance.lyrics_id,
      'lyrics_details':instance.lyrics_details
    };

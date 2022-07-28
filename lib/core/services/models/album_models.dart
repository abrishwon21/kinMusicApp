// To parse this JSON data, do
//
//     final kAlbumModel = kAlbumModelFromJson(jsonString);

import 'dart:convert';

List<KAlbumModel> kAlbumModelFromJson(String str) => List<KAlbumModel>.from(json.decode(str).map((x) => KAlbumModel.fromJson(x)));

String kAlbumModelToJson(List<KAlbumModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KAlbumModel {
    KAlbumModel({
         this.userId,
         this.id,
         this.title,
    });

    int? userId;
    int? id;
    String? title;

    factory KAlbumModel.fromJson(Map<String, dynamic> json) {
      return KAlbumModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
    );
    } 

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
    };
}

 
 class AlbumModel {
  final int? id;
  final String? title;
  final String? body;

  AlbumModel({this.id, this.title, this.body});

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      id: json['id'],
      title: json['title'] ?? "",
      body: json['body'] ?? "",
    );
  }
}
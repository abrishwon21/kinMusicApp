import 'package:clientapp/core/services/models/album_models.dart';
import 'package:flutter/cupertino.dart';

class AlbumProvider extends ChangeNotifier {
  bool loading = false;
  KAlbumModel album = KAlbumModel();
  getAlbumList(context) async {
    loading = true;
    album = await getAlbumList(context);
    loading = false;

    notifyListeners();
  }
}

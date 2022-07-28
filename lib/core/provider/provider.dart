import 'package:flutter/cupertino.dart';

import '../services/models/postmodal.dart';
import '../services/networks/api_services.dart';

class PostDataProvider with ChangeNotifier {
  PostModel post = PostModel();
  bool loading = false;

  getPostData(context) async {
    loading = true;
    post = (await getSinglePostData(context))!;
    loading = false;

    notifyListeners();
  }
}
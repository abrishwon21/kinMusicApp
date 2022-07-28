import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import '../models/postmodal.dart';
import 'package:http/http.dart' as http;

Future<PostModel?> getSinglePostData(context) async {
  PostModel? result;
  try {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = PostModel.fromJson(item);
    } else {
      //Toast.show("Data not found", context,  duration: 2, backgroundColor: Colors.redAccent);
      print("something went wrong");
    }
  } catch (e) {
    print(e);
  }

  return result;
}

import 'dart:convert';

//import 'package:clientapp/core/provider/album_provider.dart';
import 'package:clientapp/core/services/api_services.dart';
import 'package:clientapp/modules/screens/players/musicDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/provider.dart';
//import '../../../core/services/models/album_models.dart';
import 'package:http/http.dart' as http;

class MusicList extends StatefulWidget {
  const MusicList({Key? key}) : super(key: key);

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  @override
  void initState() {
    super.initState();
    //getMusics
    print(getMusics());
  }

  Widget build(BuildContext context) {
    //final albList = Provider.of<AlbumProvider>(context, listen: true).kAlbumModel;
    final postMdl = Provider.of<PostDataProvider>(context);
    return postMdl.loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: 30,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MusicDetailScreen()),
                    );
                  },
                  child: Card(
                    color: Colors.grey,
                    child: Column(children: [
                      Text(postMdl.post.title ?? ''),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                          margin: EdgeInsets.all(20),
                          child: Text(postMdl.post.body ?? ''))
                    ]),
                  ));
            });
  }
}

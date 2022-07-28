import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlbumList extends StatefulWidget {
  const AlbumList({Key? key}) : super(key: key);

  @override
  State<AlbumList> createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithMaxCrossAxisExtent(mainAxisSpacing: 10.0, maxCrossAxisExtent: 0),
           itemCount:5,
            scrollDirection:Axis.horizontal,
          itemBuilder: (context, index)=>
            Container(
              color: Colors.green,
              child: Text("hello albums"),
            )
          ),
    );
  }
}

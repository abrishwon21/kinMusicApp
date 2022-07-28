import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PodcastList extends StatefulWidget {
  const PodcastList({Key? key}) : super(key: key);

  @override
  State<PodcastList> createState() => _PodcastListState();
}

class _PodcastListState extends State<PodcastList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("this is podcast"),
    );
  }
}

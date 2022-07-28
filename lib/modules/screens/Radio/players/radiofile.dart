import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'package:radio_player/radio_player.dart';

class RadioStreamer extends StatefulWidget {
  const RadioStreamer({Key? key}) : super(key: key);

  @override
  State<RadioStreamer> createState() => _RadioStreamerState();
}

class _RadioStreamerState extends State<RadioStreamer> {
  FlutterRadioPlayer _flutterRadioPlayer = new FlutterRadioPlayer();
  RadioPlayer radioPlayer = RadioPlayer();

  @override
  void initState() {
    setState() {
      radioPlayer.setChannel(
          title: "Fana",
          url:
              "https://www.fanabc.com/english/live/#1570532799165-c7292457-e892",
          imagePath: '');
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(

        //await _flutterRadioPlayer.init("Flutter Radio Example", "Live", "http://209.133.216.3:7018/;stream.mp3", "true");

        child: ElevatedButton(
            onPressed: () {
              radioPlayer.play();
            },
            child: Text("start listening!")));
  }
}

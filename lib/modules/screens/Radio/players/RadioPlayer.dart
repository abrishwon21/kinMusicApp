import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
class RadioPlayer extends StatefulWidget {
  const RadioPlayer({Key? key}) : super(key: key);

  @override
  State<RadioPlayer> createState() => _RadioPlayerState();
}

class _RadioPlayerState extends State<RadioPlayer> {
  final assetsAudioPlayer = AssetsAudioPlayer();
final Url="https://liveonlineradio.net/bisrat-fm-101-1";

 playRadio() async{
  try {
    await assetsAudioPlayer.open(
        Audio.liveStream("http://liveonlineradio.net/player/?p=ahadu-radio-fm-94-3"),
    );
} catch (t) {
    //stream unreachable
  
}
}
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
          onPressed:(){
            playRadio();
          },
          child:Text("Listen Now")
        )
    );
  }
}

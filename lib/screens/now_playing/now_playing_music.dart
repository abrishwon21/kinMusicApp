import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:clientapp/core/services/models/music.dart';
import 'package:clientapp/services/providers/music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class NowPlayingMusic extends StatefulWidget {
  final Music? musicForId;

  const NowPlayingMusic({Key? key, this.musicForId}) : super(key: key);

  @override
  State<NowPlayingMusic> createState() => _NowPlayingMusicState();
}

class _NowPlayingMusicState extends State<NowPlayingMusic> {
  late int musicId;

  @override
  void initState() {
    // TODO: implement initState
    musicId = widget.musicForId!.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Music? music;
   musicId = music?.id ?? widget.musicForId!.id;
    var playerProvider = Provider.of<MusicPlayerProvider>(context);
    playerProvider.audioSessionListener();

    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Now Playing'),
        elevation: 2,
        backgroundColor: Colors.black,
      ),
      body: PlayerBuilder.realtimePlayingInfos(
          player: playerProvider.player,
          builder: (context, info) {
          //music = playerProvider.currentMusic as Music?;
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  _buildPlayPauseButton(playerProvider),
                ],
              ),
            );
          }),
    );
  }

  Widget _buildPlayPauseButton(MusicPlayerProvider playerProvider) {
    return PlayerBuilder.isPlaying(
        player: playerProvider.player,
        builder: (context, isPlaying) {
          return InkWell(
            onTap: () {
              if (isPlaying || playerProvider.player.isBuffering.value) {
                playerProvider.player.pause();
              } else {
                playerProvider.player.play();
              }
            },
            child: Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.red.withOpacity(0.75)],
                  ),
                  borderRadius: BorderRadius.circular(1000)),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 15,
                child: Icon(
                        isPlaying ? Icons.pause_circle : Icons.play_circle,
                        color: Colors.white,
                      ),
              ),
            ),
          );
        });
  }
}

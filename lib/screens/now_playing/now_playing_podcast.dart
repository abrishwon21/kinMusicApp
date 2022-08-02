import 'package:clientapp/services/providers/podcast_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class NowPlayingPodcast extends StatefulWidget {
  const NowPlayingPodcast({Key? key}) : super(key: key);

  @override
  State<NowPlayingPodcast> createState() => _NowPlayingPodcastState();
}

class _NowPlayingPodcastState extends State<NowPlayingPodcast> {
  //PodcastPlayerProvider playerProvider = Provider.of<PodcastPlayerProvider>;
  @override
  Widget build(BuildContext context) {
    // var playerProvider = Provider.of<PodcastPlayerProvider>(context);
    PodcastPlayerProvider playerProvider = Provider.of<PodcastPlayerProvider>(context);
    playerProvider.audioSessionListener();

    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Now Playing'),
        elevation: 2,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "My Podcast area",
              style: TextStyle(
                  color: Colors.black12,
                  fontFamily: 'Avenir',
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.cyan.shade400,
              width: 200,
              height: 200,
              child: ElevatedButton(onPressed: () {}, child: Text("Press Me")),
            )
          ],
        ),
      ),
    );
  }
}

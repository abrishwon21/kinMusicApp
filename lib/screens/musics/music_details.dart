import 'package:clientapp/services/providers/SingleMusicPlayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class SingleMusicDetailScreen extends StatefulWidget {
  const SingleMusicDetailScreen({Key? key}) : super(key: key);

  @override
  State<SingleMusicDetailScreen> createState() => _SingleMusicDetailScreenState();
}

class _SingleMusicDetailScreenState extends State<SingleMusicDetailScreen> {
  int index = 0;
  bool isLoading = false;
  bool isPlaying = false;
  var future;

  @override
  void initState() {
    future = context.read<SingleMusicPlayer>().getMusic();
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final SingleMusicPlayer musicProvider = Provider.of<SingleMusicPlayer>(
      context,
    );
    return Scaffold(
      body:Container()
    );
  }
}

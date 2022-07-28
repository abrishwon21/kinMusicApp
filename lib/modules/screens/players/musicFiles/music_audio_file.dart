import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MusicAudioFile extends StatefulWidget {
  final AudioPlayer advancedMusicPlayer;
  const MusicAudioFile({Key? key, required this.advancedMusicPlayer})
      : super(key: key);

  @override
  State<MusicAudioFile> createState() => _MusicAudioFileState();
}

class _MusicAudioFileState extends State<MusicAudioFile> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  final String? path =
      "http://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3";
  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;
  bool isRepeat = false;
  Color playerColor = Colors.black;
  Color repeatColor = Colors.black54;
  Color loopColor = Colors.black54;
  List<IconData> _icons = [Icons.play_circle_fill, Icons.pause_circle_filled];
  @override
  void initState() {
    super.initState();
    this.widget.advancedMusicPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });
    this.widget.advancedMusicPlayer.onPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });
    this.widget.advancedMusicPlayer.setSourceUrl(path!);

    this.widget.advancedMusicPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _position = Duration(seconds: 0);
        isPlaying = false;
        isRepeat = false;
        playerColor = Colors.black;
      });
    });
  }

  Widget btnStart() {
    return IconButton(
        padding: const EdgeInsets.only(bottom: 10),
        icon: isPlaying == false
            ? Icon(
                _icons[0],
                size: 50,
                color: playerColor,
              )
            : Icon(
                _icons[1],
                size: 50,
                color: Colors.red.shade400,
              ),
        onPressed: () {
          if (isPlaying == false) {
            this.widget.advancedMusicPlayer.resume();
            setState(() {
              isPlaying = true;
            });
          } else {
            this.widget.advancedMusicPlayer.pause();
            setState(() {
              isPlaying = false;
              isPaused = true;
            });
          }
        });
  }

  Widget loadAsset() {
    return Container(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            repeatButton(),
            slowButton(), 
            btnStart(), 
            forwardButton(),
            shuffleButton(),
            ]),
    );
  }

//create a slider
  Widget slider() {
    return Slider(
      activeColor: Colors.red,
      inactiveColor: Colors.grey,
      value: _position.inSeconds.toDouble(),
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          changeToSecond(value.toInt());
          value = value;
        });
      },
    );
  }

//to change into second
  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    this.widget.advancedMusicPlayer.seek(newDuration);
  }

//forward button
  Widget forwardButton() {
    return IconButton(
      icon: Icon(
        FontAwesomeIcons.fastForward,
        color: Color(0xFF17191B),
        size: 24,
      ),
      onPressed: () {
        this.widget.advancedMusicPlayer.setPlaybackRate(1.5);
      },
    );
  }

//backward button
  Widget slowButton() {
    return IconButton(
      icon: Icon(
        FontAwesomeIcons.fastBackward,
        color: Color(0xFF17191B),
        size: 24,
      ),
      onPressed: () {
        this.widget.advancedMusicPlayer.setPlaybackRate(0.5);
      },
    );
  }

//repeat button
  Widget repeatButton() {
    return IconButton(
      icon: Icon(
        Icons.repeat_outlined,
        color: repeatColor,
        size: 16,
      ),
      onPressed: () {
        if (isRepeat == false) {
          this.widget.advancedMusicPlayer.setReleaseMode(ReleaseMode.loop);
          setState(() {
             isRepeat = true; 
              repeatColor = Colors.blueAccent.shade700;
          });
        }else if(isRepeat==true){
        this.widget.advancedMusicPlayer.setReleaseMode(ReleaseMode.release);
          setState(() {
            //isRepeat = false;
            repeatColor = Colors.black54;
          });
        }
      },
    );
  }

//loop button
  Widget shuffleButton() {
    return IconButton(
      icon: Icon(
        Icons.shuffle_on_rounded,
        color: Color(0xFF17191B),
            size: 16,
      ),
      onPressed: () {
        if(isLoop==false){
          this.widget.advancedMusicPlayer.setPlaybackRate(0.9);
        }
      },
    );
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _position.toString().split(".")[0],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                _duration.toString().split(".")[0],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        ),
       
        slider(),
        loadAsset(),
      ]),
    );
  }
}

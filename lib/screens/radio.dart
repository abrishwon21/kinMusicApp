import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:clientapp/constants/api_paths.dart';
import 'package:clientapp/services/providers/radio_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:provider/provider.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({Key? key}) : super(key: key);

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int index = 0;
  bool isLoading = false;
  bool isPlaying = false;
  var future;

  @override
  void initState() {
    future = context.read<RadioProvider>().getStations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*
    var podcastProvider = Provider.of<PodcastPlayer>(
      context,
    );
    var musicProvider = Provider.of<MusicPlayer>(
      context,
    );
    */
    final RadioProvider radioProvider = Provider.of<RadioProvider>(
      context,
    );
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text('Radio'),
          backgroundColor: Colors.transparent,
        ),
        body: FutureBuilder(
          future: future,
          builder: (context, AsyncSnapshot snapshot) {
            
              if (snapshot.hasData) {
                return PlayerBuilder.isPlaying(
                    player: radioProvider.player,
                    builder: (context, playing) {
                      return Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  '$apiUrl/${radioProvider.stations[radioProvider.currentIndex].coverImage}')),
                          // color: Colors.red,
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.cyan.withOpacity(0.3),
                                      Colors.black45
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.stretch,

                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height/50,
                                  ),
                                  SizedBox(
                                    height: 200,
                                    width: 200,
                                    child: Card(
                                      elevation: 25,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 200,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      '$apiUrl/${radioProvider.stations[radioProvider.currentIndex].coverImage}')),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.deepOrangeAccent
                                                      .withOpacity(0.4),
                                                  Colors.deepPurpleAccent
                                                      .withOpacity(0.1),
                                                  Colors.deepOrange.withOpacity(0.4)
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height/50,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        radioProvider
                                            .stations[
                                                radioProvider.currentIndex]
                                            .mhz,
                                        style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 35,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      const Text(
                                        'mhz',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height/50,
                                  ),
                                  Row(
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildPreviousButton(radioProvider),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width/6,
                                      ),
                                      _buildPlayButton(
                                          radioProvider,
                                          playing),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width/6,
                                      ),
                                      _buildNextButton(radioProvider)
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }
              return const Center(
                child: Text(
                  'No Data',
                  style: TextStyle(color: Colors.black),
                ),
              );
          
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  Widget _buildNextButton(RadioProvider radioProvider) {
   // ConnectivityStatus status = Provider.of<ConnectivityStatus>(context);

    return GestureDetector(
      child: Container(
        color: Colors.transparent,
        child: Icon(
          Icons.skip_next,
          size: 40,
          color: Colors.grey,
        ),
      ),
      onTap: () {
        if (!radioProvider.isLastStation(radioProvider.currentIndex + 1)) {

          
           // podcastProvider.player.stop();
           // musicProvider.player.stop();

           // musicProvider.setMusicStopped(true);
            //podcastProvider.setEpisodeStopped(true);

           // musicProvider.listenMusicStreaming();
            //podcastProvider.listenPodcastStreaming();
            radioProvider.setPlayer(
                radioProvider.player);
            radioProvider.next();

         
        }
      },
    );
  }

  Widget _buildPreviousButton(RadioProvider radioProvider) {
    //ConnectivityStatus status = Provider.of<ConnectivityStatus>(context);

    return GestureDetector(
      child: Container(
        child: Icon(
          Icons.skip_previous,
          size: 40,
          color: radioProvider.isFirstStation() ? Colors.grey : Colors.red,
        ),
        color: Colors.transparent,
      ),
      onTap: () {

        
          //podcastProvider.player.stop();
          //musicProvider.player.stop();

        //  musicProvider.setMusicStopped(true);
         // podcastProvider.setEpisodeStopped(true);

         // musicProvider.listenMusicStreaming();
         // podcastProvider.listenPodcastStreaming();

          radioProvider.setPlayer(
              radioProvider.player);
          radioProvider.prev();
        
      },
    );
  }

  Widget _buildPlayButton(
      RadioProvider radioProvider,
     // PodcastPlayer podcastProvider,
     // MusicPlayer musicProvider,
      bool isPlaying) {
    //ConnectivityStatus status = Provider.of<ConnectivityStatus>(context);

    return InkWell(
      onTap: () {


        if (!radioProvider.isPlaying) {
          
           // podcastProvider.player.stop();
           // musicProvider.player.stop();

            //musicProvider.setMusicStopped(true);
            //podcastProvider.setEpisodeStopped(true);

           // musicProvider.listenMusicStreaming();
           // podcastProvider.listenPodcastStreaming();
            radioProvider.setPlayer(
                radioProvider.player);
            radioProvider.handlePlayButton(radioProvider.currentIndex);
            radioProvider.setIsPlaying(true);
         
        } else {
          radioProvider.player.pause();
          radioProvider.setIsPlaying(false);
        }
      },
      child: Card(
        elevation: 50,
        color: Colors.transparent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
        child: Container(
          width: 90,
          height: 90,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black26, Colors.cyan.withOpacity(0.75)],
              ),
              borderRadius: BorderRadius.circular(1000)),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 50,
            child: !radioProvider.isStationLoaded
                ? SpinKitFadingCircle(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: index.isEven ? Colors.deepPurpleAccent : Colors.white,
                        ),
                      );
                    },
                    size: 30,
                  )
                : Icon(
                    isPlaying
                        ? Icons.pause_circle
                        : Icons.play_arrow_rounded,
                 
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}

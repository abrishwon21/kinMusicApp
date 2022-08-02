import 'package:clientapp/core/provider/music_player_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../core/services/models/music.dart';

class MusicCard extends StatelessWidget {
  final double width, aspectRatio;
  final Music music;
  final int musicIndex;
  final List<Music> musics;
  bool? isForPlaylist;

  MusicCard(
      {Key? key,
      this.width = 125,
      this.aspectRatio = 1.02,
      required this.music,
      this.musicIndex = -1,
      required this.musics,
      this.isForPlaylist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<MusicPlayerProvider>(context);
    return Container();
  }
}
/*

class MusicCard extends StatelessWidget {
  MusicCard(
      {Key? key,
      this.width = 125,
      this.aspectRatio = 1.02,
      required this.music,
      required this.musics,
      this.musicIndex = -1,
      this.isForPlaylist})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    ConnectivityStatus status = Provider.of<ConnectivityStatus>(context);
    final provider = Provider.of<PlayListProvider>(context, listen: false);
    var p = Provider.of<MusicPlayer>(
      context,
    );
    var podcastProvider = Provider.of<PodcastPlayer>(
      context,
    );
    var radioProvider = Provider.of<RadioProvider>(
      context,
    );

    return  PlayerBuilder.isPlaying(
        player: p.player,
        builder: (context, isPlaying) {
          return Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
            child: SizedBox(
              width: getProportionateScreenWidth(width),
              child: GestureDetector(
                onTap: () {
                  if (checkConnection(status)) {
                    incrementMusicView(music.id);
                    p.setBuffering(musicIndex);

                    if (p.isMusicInProgress(music)) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NowPlayingMusic(music)));
                    } else {
                      radioProvider.player.stop();
                      podcastProvider.player.stop();
                      p.player.stop();

                      p.setMusicStopped(true);
                      podcastProvider.setEpisodeStopped(true);
                      p.listenMusicStreaming();
                      podcastProvider.listenPodcastStreaming();

                      p.setPlayer(p.player, podcastProvider, radioProvider);

                      p.handlePlayButton(
                        music: music,
                        index: musicIndex,
                        album: Album(
                            id: -2,
                            title: 'Single Music $musicIndex',
                            artist: 'kin',
                            description: '',
                            cover: 'assets/images/kin.png',
                            musics: musics),
                      );

                      p.setMusicStopped(false);
                      podcastProvider.setEpisodeStopped(true);
                      p.listenMusicStreaming();
                      podcastProvider.listenPodcastStreaming();
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content:  Text('No Connection',style: TextStyle(color: kGrey),),
                    ));
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1.3,
                        child: Hero(
                          tag: '${music.id}',
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: '$apiUrl/${music.cover}',
                                  fit: BoxFit.cover,
                                  width: getProportionateScreenWidth(width),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: p.currentMusic == null
                                    ? Container()
                                    : p.currentMusic!.title ==
                                            musics[musicIndex].title
                                        ? TrackMusicPlayButton(
                                            music: music,
                                            index: musicIndex,
                                            album: Album(
                                                id: -2,
                                                title:
                                                    'Single Music $musicIndex',
                                                artist: 'kin',
                                                description: '',
                                                cover: 'assets/images/kin.png',
                                                musics: musics),
                                          )
                                        : Container(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(100),
                            child: Text(
                              music.title,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ),
                          PopupMenuButton(
                            initialValue: 0,
                            child: const Icon(
                              Icons.more_vert,
                              color: kGrey,
                            ),
                            onSelected: (value) {
                              if (value == 2) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor: kPrimaryColor,
                                        title: const Text(
                                          'Music Detail',
                                          style: TextStyle(
                                              color: Colors.white60,
                                              fontSize: 15),
                                        ),
                                        content: SizedBox(
                                          height: 100,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  music.description,
                                                  style: const TextStyle(
                                                      color:
                                                          kLightSecondaryColor),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text('By ${music.artist}',
                                                    style: const TextStyle(
                                                        color:
                                                            kLightSecondaryColor))
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor: kPrimaryColor,
                                        title: Text(
                                          'Choose Playlist',
                                          style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.7)),
                                        ),
                                        content: SizedBox(
                                          height: 200,
                                          width: 200,
                                          child: FutureBuilder<
                                              List<PlayListTitles>>(
                                            future: provider.getPlayListTitle(),
                                            builder: (context,
                                                AsyncSnapshot<
                                                        List<PlayListTitles>>
                                                    snapshot) {
                                              if (snapshot.hasData) {
                                                return ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      snapshot.data!.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Consumer<
                                                        PlayListProvider>(
                                                      builder:
                                                          (BuildContext context,
                                                              provider, _) {
                                                        return TextButton(
                                                            onPressed:
                                                                () async {
                                                              var playlistInfo =
                                                                  {
                                                                'playListTitleId':
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .id,
                                                                'musicId':
                                                                    music.id
                                                              };
                                                              var result =
                                                                  await provider
                                                                      .addMusicToPlaylist(
                                                                          playlistInfo);

                                                              if (result) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(const SnackBar(
                                                                        content:
                                                                            Text('Successfully added')));
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(const SnackBar(
                                                                        content:
                                                                            Text('Music Already added')));
                                                              }
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text(
                                                              snapshot
                                                                  .data![index]
                                                                  .title,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: const TextStyle(
                                                                  color:
                                                                      kLightSecondaryColor),
                                                            ));
                                                      },
                                                    );
                                                  },
                                                );
                                              }
                                              return Center(
                                                child: KinProgressIndicator(),
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    });
                              }
                            },
                            itemBuilder: (context) {
                              return kMusicPopupMenuItem;
                            },
                          ),
                        ],
                      ),
                    ),
                    Text(
                      music.artist,
                      style: const TextStyle(color: kGrey),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        },
      );

  }
}

*/
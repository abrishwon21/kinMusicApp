import 'package:clientapp/modules/screens/Podcasts/podcastList.dart';
import 'package:clientapp/modules/screens/Radio/players/radiofile.dart';
import 'package:clientapp/modules/screens/Radio/radioList.dart';
import 'package:clientapp/modules/screens/Radio/radio_details.dart';
import 'package:clientapp/modules/screens/homePage.dart';
import 'package:clientapp/modules/screens/library/favorite.dart';
import 'package:clientapp/modules/screens/players/musicDetail.dart';
import 'package:clientapp/modules/screens/players/musicList.dart';
import 'package:clientapp/modules/screens/welcomePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  final screens = [MusicDetailScreen(), PodcastList(), RadioStreamer(), Favorite()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.grey,
          color: Colors.deepPurpleAccent.shade700,
          animationCurve: Curves.easeInCubic,
          //animationDuration: Duration(milliseconds: 400),
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
          items: [
            Icon(Icons.music_note_rounded),
            Icon(Icons.podcasts_sharp),
            Icon(Icons.radio),
            Icon(Icons.favorite)
          ]),
      appBar:AppBar(
        
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                    color: Colors.white,
                  )
                ],
                backgroundColor: Colors.transparent,
                elevation: 0.0,
         
       ),
      body: screens[index],
    );
  }
}

import 'package:audioplayers/audioplayers.dart';
import 'package:clientapp/modules/screens/Podcasts/podcastFile/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PodcastDetails extends StatefulWidget {
  const PodcastDetails({Key? key}) : super(key: key);

  @override
  State<PodcastDetails> createState() => _PodcastDetailsState();
}

class _PodcastDetailsState extends State<PodcastDetails> {
    AudioPlayer advancedPodcastPlayer = AudioPlayer();
  @override
  void initState() {
    advancedPodcastPlayer = AudioPlayer();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey,
        body: Stack(
      alignment: Alignment.center,
      children: [
               Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight / 3,
            child: Container(
              color: Color.fromARGB(255, 22, 20, 20),
            ),
          ),

          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: screenHeight / 5,
              child: AppBar(
                leading: IconButton(
                  onPressed: () {
                 
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.transparent,
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                    color: Colors.transparent,
                  )
                ],
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              )),
          Positioned(
              left: 0,
              right: 0,
              top: screenHeight * 0.2,
              height: screenHeight * 0.36,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                child: Column(children: [
                  SizedBox(height: screenHeight * 0.1),
                  Text(
                    "Business",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text("Elias Amelga", style: TextStyle(fontSize: 16)),

                 PodcastAudioFile(advancedPodcastPlayer: advancedPodcastPlayer)
                ]),
              )),


               Positioned(
              left: (screenWidth - 150) / 2,
              right: (screenWidth - 150) / 2,
              top: screenHeight * 0.12,
              height: screenHeight * 0.16,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white12,
                    width: 2,
                  ),
                  color: Colors.grey.shade400,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: screenHeight * 0.1,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        //borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.0),
                        image: DecorationImage(
                          image: AssetImage('/elias.jpg'),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              )),

     ],
    ));
  }
}

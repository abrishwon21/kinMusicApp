import 'package:clientapp/modules/screens/players/albumList.dart';
import 'package:clientapp/modules/screens/players/musicList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AlbumList());
  }
}

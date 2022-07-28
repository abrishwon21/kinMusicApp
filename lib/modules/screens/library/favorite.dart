import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey,
        body: Center(
      child: SingleChildScrollView(
          child: Column(
        children: [
          Card( 
            child: Expanded(
            child:Text("Tedy afro"),
          ), color: Colors.grey.shade100),
          Card(
            child: Expanded(
              child:Text("Aster")
            ),
            color: Colors.grey.shade100,
          )
        ],
      )),
    ));
  }
}

import 'package:clientapp/core/auths/auth_service.dart';
import 'package:clientapp/core/provider/album_provider.dart';
import 'package:clientapp/modules/screens/mainScreen.dart';

import 'package:clientapp/modules/screens/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';

import 'core/provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  /*
   <script>
  const firebaseConfig = {
    apiKey: "AIzaSyAGLKuYoONwENdZ7nhyiym7Bio_D-6cG04",
    authDomain: "kinideas-firebase.firebaseapp.com",
    databaseURL: "https://kinideas-firebase-default-rtdb.firebaseio.com",
    projectId: "kinideas-firebase",
    storageBucket: "kinideas-firebase.appspot.com",
    messagingSenderId: "898355390271",
    appId: "1:898355390271:web:997820192699342bc9558a",
    measurementId: "G-6XHVX08LP3"
  };
 // firebase.initiallizeApp(firebaseConfig)
</script>
*/
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: "AIzaSyAGLKuYoONwENdZ7nhyiym7Bio_D-6cG04",
      appId: "1:898355390271:web:997820192699342bc9558a",
      messagingSenderId: "898355390271",
      projectId: "kinideas-firebase",
      storageBucket: "kinideas-firebase.appspot.com",
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PostDataProvider>(create: (_)=>PostDataProvider())
      ],
    
   child: MyApp(),
  )
  
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)=>ChangeNotifierProvider(create: (context)=>
  GoogleSignInProvider(),
  child: MaterialApp(
    
      title: 'Kin Music',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          scaffoldBackgroundColor: Colors.grey.shade100,
       
          primarySwatch: Colors.grey,
        ),
       // home: MainScreen(),
    home: MainScreen()
     
  )
  );
}


/*
{
    return MaterialApp(
        title: 'Kin Music',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          scaffoldBackgroundColor: Colors.grey.shade100,
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.grey,
        ),
        home: AuthService().handleAuth());
  
  }
 */
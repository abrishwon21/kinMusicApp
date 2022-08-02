import 'package:clientapp/core/auths/auth_service.dart';
import 'package:clientapp/modules/screens/user_account/signUp.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(  
        elevation: 2,
        backgroundColor: Colors.black38,
        leading: Text("K I N Ideas",
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40, color: Colors.white10),),
       ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'K I N Ideas',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                     prefixIcon:Icon(Icons.email_rounded),
                      
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      prefixIcon:Icon(Icons.lock_clock_rounded),
                      suffix: Icon(Icons.visibility_off)
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text(
                    'Forgot Password',
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        //print(nameController.text);
                        // print(passwordController.text);
                        AuthService().signIn(
                            nameController.text, passwordController.text);
                      },
                    )),
                Row(
                  children: <Widget>[
                    const Text('Do not have account?'),
                    TextButton(
                      child: const Text(
                        'Create Account',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                        );
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                _BuildGoogleButton(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                _BuildFacebookButton(),
              ],
            )));
  }

  Widget _BuildGoogleButton() {
    return
        //with google

        InkWell(
      child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 18,
          margin: EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.black),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 30.0,
                width: 30.0,
                child: Icon(Icons.linked_camera_outlined),
              ),
              Text(
                'Sign in with Google',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ))),
      onTap: () async {
        AuthService().SignInWithGoogle();
      },
    );
  }

  Widget _BuildFacebookButton() {
    return
        //with google

        InkWell(
      child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 18,
          margin: EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.black),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 30.0,
                width: 30.0,
                child: Icon(Icons.facebook_sharp),
              ),
              Text(
                'Sign in with Facebook',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ))),
      onTap: () async {
        /*
hp                      signInWithGoogle(model)
                          .then((FirebaseUser user){
                        model.clearAllModels();
                        Navigator.of(context).pushNamedAndRemoveUntil
                          (RouteName.Home, (Route<dynamic> route) => false
                        );}
                        ).catchError((e) => print(e));
                    */
      },
    );
  }
}

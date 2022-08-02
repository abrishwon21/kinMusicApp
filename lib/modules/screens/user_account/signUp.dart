import 'package:clientapp/core/auths/auth_service.dart';
import 'package:clientapp/modules/screens/user_account/signIn.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(  
        elevation: 2,
        backgroundColor: Colors.white30,
        leading: Text("K I N",
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),),
       ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'K I N Ideas ',
                      style: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.w400,
                          fontSize: 40),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Register Now',
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_rounded, color: Colors.black26,)
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
                      child: const Text('Sign Up'),
                      onPressed: () {
                        AuthService().signUp(
                            nameController.text, passwordController.text);
                      },
                    )),
                Row(
                  children: <Widget>[
                    const Text('have an account?'),
                    TextButton(
                      child: const Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signin screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()),
                        );
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                _BuildGoogleButton(),
                SizedBox(height: MediaQuery.of(context).size.height/50,),
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
                'Sign up with Google',
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
                'Sign up with Facebook',
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

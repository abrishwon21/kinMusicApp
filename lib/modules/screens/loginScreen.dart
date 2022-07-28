import 'package:clientapp/core/auths/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email, password;
  final _formKey = new GlobalKey<FormState>();
  

  var checker = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 250,
          width: 300.0,
          child: Column(children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 25.0, right: 25.0),
                        child: Container(
                            height: 50.0,
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Email'),
                              validator: (value) {
                                if (value == '') {
                                  Text("please enter your email!");
                                }
                              },
                              onChanged: (value) {
                                this.email = value;
                              },
                            ))),

                    //password
                    Padding(
                        padding: EdgeInsets.only(
                            left: 25.0, right: 25.0, bottom: 5.0, top: 5.0),
                        child: Container(
                            height: 50.0,
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'Password'),
                              obscureText: true,
                              validator: (value) {
                                if (value == '') {
                                  Text("Enter your password");
                                }
                              },
                              onChanged: (value) {
                                this.password = value;
                              },
                            ))),

                    //button

                    InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            AuthService().signIn(email, password);
                          }
                        },
                        child: Container(
                          height: 40.0,
                          width: 100.0,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.3),
                          ),
                          child: Text("Sign In"),
                        ))
                  ]),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary:Colors.white,
                onPrimary: Colors.black,
                minimumSize: Size(double.infinity, 50),
                ),
                icon: FaIcon(FontAwesomeIcons.google, color: Colors.blueGrey,),
                label: Text("Sign up with Gmail"),
                 onPressed: (){
                  final provider = Provider.of<GoogleSignInProvider>(context, listen:false);
                  provider.googleLogIn();
                 }
              )

          ]),
        ),
      ),
    );
  }
}

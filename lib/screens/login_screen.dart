import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_app/constants.dart';
import 'package:flash_chat_app/screens/chat_screen.dart';
import 'package:flash_chat_app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200,
                    child: Image.asset(
                      "assets/images/Flash_logo.png",
                      height: 60,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 48,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  // Do something with the user Input
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your Email'),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    // Do something with the user Input
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Password')),
              SizedBox(
                height: 24,
              ),
              RoundedButton(
                action: () async {
                  setState(() {
                    showSpinner = true;
                  });

                  try {
                    print(email! + " " + password!);
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email!, password: password!);
                    print(userCredential.user);
                    Navigator.pushNamed(context, ChatScreen.id);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password Provided for that user. ');
                    }
                  } finally {
                    setState(() {
                      showSpinner = false;
                    });
                  }
                },
                title: "Login",
                Colour: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}

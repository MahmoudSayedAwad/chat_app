import 'package:flash_chat_app/constants.dart';

import 'package:flash_chat_app/screens/login_screen.dart';
import 'package:flash_chat_app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'RegistrationScreen';
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200,
                  child: Image.asset("assets/images/Flash_logo.png"),
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
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  // Do something with the user Input
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your Password'),
              ),
              SizedBox(
                height: 24,
              ),
              RoundedButton(
                action: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email!, password: password!);
                    Navigator.pushNamed(context, LoginScreen.id);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The Password Provided is too weak.');
                    } else if (e.code == 'email-alreay- in-use') {
                      print('The account already exists for that email');
                    }
                  } catch (e) {
                    print(e);
                  } finally {
                    setState(() {
                      showSpinner = false;
                    });
                  }
                },
                title: 'Register',
                Colour: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

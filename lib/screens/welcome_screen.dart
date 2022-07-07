import 'package:flash_chat_app/screens/login_screen.dart';
import 'package:flash_chat_app/screens/reg_screen.dart';
import 'package:flash_chat_app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'WelcomeScreen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    controller = AnimationController(
      vsync: this,
      // upperBound: 100,
      duration: Duration(
        seconds: 5,
      ),
    );
    // animation = CurvedAnimation(parent: controller!, curve: Curves.easeInSine);

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller!);
    controller!.forward();
    // animation!.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller!.reverse(from: 1);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller!.forward();
    //   }
    // });

    controller?.addListener(() {
      setState(() {});
      print(animation?.value);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red.withOpacity(controller!.value),
      backgroundColor: animation!.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset(
                      'assets/images/Flash_logo.png',
                    ),
                    // height: animation!.value * 100,
                    height: 60,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48,
            ),
            RoundedButton(
              title: 'Log In',
              Colour: Colors.lightBlueAccent,
              action: () {
                Future.delayed(Duration.zero, (() {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                      (route) => false);
                }));
              },
            ),
            RoundedButton(
                title: 'Register',
                Colour: Colors.blueAccent,
                action: () {
                  Future.delayed(Duration.zero, (() {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => RegistrationScreen()),
                        (route) => false);
                  }));
                })
          ],
        ),
      ),
    );
  }
}

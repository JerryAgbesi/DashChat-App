import 'package:dash_chat/screens/login_screen.dart';
import 'package:dash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animation =
        ColorTween(begin: Colors.grey, end: Colors.white).animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/chatLogo.png'),
                    height: 100.0,
                  ),
                ),
                AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText(
                    'Dash Chat',
                    textStyle: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                    speed: const Duration(milliseconds: 55),
                  ),
                ]),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                label: 'Log in',
                function: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                color: Colors.lightBlueAccent),
            RoundedButton(
                label: 'Register',
                function: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}

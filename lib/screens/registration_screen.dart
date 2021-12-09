import 'package:dash_chat/components/rounded_button.dart';
import 'package:dash_chat/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dash_chat/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;

  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;
  late String confirmedPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/chatLogo.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                style: const TextStyle(color: Colors.black),
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                style: const TextStyle(color: Colors.black),
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  confirmedPassword = value;
                },
                style: const TextStyle(color: Colors.black),
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Confirm your password'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  label: 'Register',
                  function: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      if (password == confirmedPassword) {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);

                        if (newUser != null) {
                          Navigator.pushNamed(context, ChatScreen.id);
                        }
                      } else
                        print("passwords don't match");
                    } catch (e) {
                      print(e);
                    }
                  },
                  color: Colors.blueAccent),
            ],
          ),
        ),
      ),
    );
  }
}

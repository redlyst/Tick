import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'color_pallete.dart' as colorPallete;
import 'dart:async';

import 'loginscreen.dart';
import 'homescreen.dart';
import 'secondhome.dart';

void main() => runApp(InitScreen());

class InitScreen extends StatelessWidget {
  const InitScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: colorPallete.primaryColor,
          accentColor: colorPallete.accentColor),
      // primaryColor: Colors.black,
      // accentColor: Colors.yellow),
      initialRoute: '/',
      routes: {
        '/': (context) => InitLogin(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/shome': (context) => SecondHomeScreen(),
      },
    );
  }
}

class InitLogin extends StatefulWidget {
  InitLogin({Key key}) : super(key: key);

  _InitLoginState createState() => _InitLoginState();
}

class _InitLoginState extends State<InitLogin> {
  var _duration;

  startTimeLogin() async {
    _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPageLogin);
  }

  void navigationPageLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimeLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            color: Colors.white,
            child: Center(
              child: GlowingProgressIndicator(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 110.0,
                  child: Image.asset('images/5204985.jpg'),
                ),
              ),
            )),
      ),
    );
  }
}

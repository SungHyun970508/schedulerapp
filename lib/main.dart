import 'package:flutter/cupertino.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'calendarImage',
      theme: CupertinoThemeData(primaryColor: Colors.blue),
      home: AnimatedSplashScreen(
        splash: Image.asset('Assets/Image/calendar.png'),
        nextScreen: MainWidget(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.blue[100],
        //backgrounColor: Colors.white,
        //duration: 3000,
      ),
    );
  }
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: Center(child: Text("안녕하십니까!!!")),
    );
  }
}

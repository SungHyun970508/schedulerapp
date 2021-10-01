import 'package:flutter/cupertino.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:schedulerapp/signUp.dart';

void main() {
  runApp(CupertinoApp(home: MyApp()));
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
  final TextEditingController _tct = new TextEditingController(text: "");
  // 하나는 id 하나는 pw해서 같이 묶어서 보내게 하기
  // final TextEditingController _tct2 = new TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Login'),
        ),
        child: SafeArea(
          child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              child: Column(children: [
                Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: CupertinoTextField(
                        controller: _tct,
                        clearButtonMode: OverlayVisibilityMode.editing,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                        ),
                        onEditingComplete: _subMit)),
                // Container(
                //     width: MediaQuery.of(context).size.width / 3,
                //     child: CupertinoTextField(
                //         controller: _tct2,
                //         clearButtonMode: OverlayVisibilityMode.editing,
                //         decoration: BoxDecoration(
                //           border: Border.all(color: Colors.blue),
                //         ),
                //         onEditingComplete: _subMit)),
                CupertinoButton(child: Text("Login"), onPressed: _subMit),
                CupertinoButton(
                    child: Text('Sign Up'),
                    onPressed: () => Navigator.of(context).push(
                        CupertinoPageRoute<void>(
                            builder: (BuildContext context) => SignUpPage()))),
              ])),
        ));
  }

  void _subMit() {
    if (_tct.text.isEmpty) return print("입력해주세요");
    print("입력한 데이터 : ${_tct.text}");
    return _tct.clear();
  }
}

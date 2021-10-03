import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text("Sign up")),
        child: SafeArea(
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: CupertinoTextField(
                          clearButtonMode: OverlayVisibilityMode.editing,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                          ),
                        )),
                    CupertinoButton(
                      child: Text("Sign Up"),
                    ),
                  ],
                ))));
  }
}

// child: Center(
//           child: CupertinoButton(
//               child: Text("Back"),
//               onPressed: () => Navigator.of(context).pop()),
//         )
import 'package:flutter/cupertino.dart';
import 'main.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text("Sign up")),
        child: Center(
          child: CupertinoButton(
              child: Text("Back"),
              onPressed: () => Navigator.of(context).pop()),
        ));
  }
}

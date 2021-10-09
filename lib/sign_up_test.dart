import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

import 'user_model.dart';

class SignUpTestPage extends StatefulWidget {
  SignUpTestPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _SignUpTestPage createState() => _SignUpTestPage();
}

Future<UserModel> createUser(
    String email,
    int group,
    String img,
    String loginId,
    String nickName,
    String phoneNumber,
    String pwd,
    String userName) async {
  final String apiUrl = "https://api/v1/auth/sign-up";

  final response = await http.post(Uri.parse(apiUrl), body: {
    "email": email,
    "group": group,
    "img": img,
    "loginId": loginId,
    "nickName": nickName,
    "phoneNumber": phoneNumber,
    "pwd": pwd,
    "userName": userName
  });

  if (response.statusCode == 201) {
    final String responseString = response.body;

    return userModelFromJson(responseString);
  } else {
    return null;
  }
}

class _SignUpTestPage extends State<SignUpTestPage> {
  UserModel _user;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController groupController = TextEditingController();
  final TextEditingController imgController = TextEditingController();
  final TextEditingController loginIdController = TextEditingController();
  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter email here'
              ),
              controller: emailController,
            ),
            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter group integer here'
              ),
              controller: groupController,
            ),
            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter img string here'
              ),
              controller: imgController,
            ),
            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter loginId here'
              ),
              controller: loginIdController,
            ),
            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter nickName here'
              ),
              controller: nickNameController,
            ),
            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter phoneNumber here'
              ),
              controller: phoneNumberController,
            ),
            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter pwd here'
              ),
              controller: pwdController,
            ),
            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter userName here'
              ),
              controller: userNameController,
            ),
            SizedBox(height: 10),

            _user == null
                ? Container()
                : Text(
                    "The user ${_user.email}, ${_user.loginId} is created successfully at time ${_user.userName}"),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String email = emailController.text;
          final int group = int.parse(groupController.text);
          final String img = imgController.text;
          final String loginId = loginIdController.text;
          final String nickName = nickNameController.text;
          final String phoneNumber = phoneNumberController.text;
          final String pwd = pwdController.text;
          final String userName = userNameController.text;

          final UserModel user = await createUser(
              email, group, img, loginId, nickName, phoneNumber, pwd, userName);

          setState(() {
            _user = user;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

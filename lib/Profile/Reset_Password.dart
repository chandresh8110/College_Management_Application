import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../General Side/theme_helper.dart';

class Reset_Password extends StatefulWidget {
  const Reset_Password({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<Reset_Password> createState() => _Reset_PasswordState();
}

class _Reset_PasswordState extends State<Reset_Password> {
  TextEditingController pwdcontroller = TextEditingController();

  Future Resetpwd() async {
    var url = "http://103.141.241.97/test/reset_pwd.php";
    final response = await http.post(Uri.parse(url), body: {
      "username": widget.username,
      "pwd": pwdcontroller.text,
    });
    print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        // backgroundColor: Colors.blue,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.lightGreenAccent,
                Colors.lightBlueAccent,
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10),
              child: Container(
                child: TextField(
                  controller: pwdcontroller,
                  decoration: ThemeHelper().textInputDecoration(
                    "Enter New Password",
                    "Enter New Password",
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: ThemeHelper().buttonBoxDecoration(context),
              child: SizedBox(
                // width: double.infinity,
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  onPressed: () {
                    Resetpwd();
                    Navigator.of(context).pop();
                  },
                  child: Text("Reset Password"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

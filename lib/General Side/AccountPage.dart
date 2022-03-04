// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';
import 'package:final_app/Student%20Side/Student_Slider/SSliderDrawer.dart';
import 'package:final_app/slider/SliderDrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Developer_Team/Developer_slider/DSliderDrawer.dart';
import '../Faculty Side/Faculty Slider/FSliderDrawer.dart';
import '../HOD_Side/HOD_Slider/HSliderDrawer.dart';
import 'header_widget.dart';
import 'theme_helper.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  String? dropdownValue;
  String? table;

  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();

  Future login() async {
    var url = "http://103.141.241.97/test/login_w_role.php";
    var response = await http.post(Uri.parse(url), body: {
      "table": dropdownValue,
      "username": usernamecontroller.text,
      "password": passwordcontroller.text,
    });

    var data = json.decode(response.body);
    if (data == "Student") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SSliderDrawer(
            username: usernamecontroller.text,
          ),
        ),
      );
    } else if (data == "Faculty") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => FSliderDrawer(
            username: usernamecontroller.text,
          ),
        ),
      );
    } else if (data == "HOD") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HSliderDrawer(
            username: usernamecontroller.text,
          ),
        ),
      );
    } else if (data == "Developer") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DSliderDrawer(
            username: usernamecontroller.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _headerHeight,
                child: HeaderWidget(
                  _headerHeight,
                  true,
                ), //let's create a common header widget
              ),
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      const Text(
                        'Hello!',
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Sign in into your account',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 30),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(color: Colors.grey),
                                    color: Colors.white,
                                  ),
                                  child: DropdownButton<String>(
                                    value: dropdownValue,
                                    hint: Text("Select Role"),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    elevation: 20,
                                    isExpanded: true,
                                    // style: const TextStyle(color: Colors.deepPurple),
                                    underline: Container(
                                      height: 0,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      'Student',
                                      'Faculty',
                                      'HOD',
                                      'Developer'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: TextField(
                                controller: usernamecontroller,
                                decoration: ThemeHelper().textInputDecoration(
                                    'User Name', 'Enter your user name'),
                              ),
                              decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            const SizedBox(height: 30.0),
                            Container(
                              child: TextField(
                                controller: passwordcontroller,
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration(
                                    'Password', 'Enter your password'),
                              ),
                              decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            const SizedBox(height: 30.0),
                            Container(
                              decoration:
                                  ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                onPressed: () {
                                  login();
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    'Login'.toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SliderDrawer(),),);
        return false;
      },
    );
  }
}

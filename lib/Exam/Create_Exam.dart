// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:final_app/Developer_Team/Developer_slider/DMenuWidget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Create_Exam extends StatefulWidget {
  const Create_Exam({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<Create_Exam> createState() => _Create_ExamState();
}

class _Create_ExamState extends State<Create_Exam> {
  TextEditingController idcontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();

  late bool error, sending, success;
  late String msg;
  String table = 'Exam';

  @override
  void initState() {
    error = false;
    sending = false;
    success = false;
    msg = "";
    super.initState();
  }

  Future<void> sendData() async {
    var url = "http://103.141.241.97/test/exam.php";
    var res = await http.post(Uri.parse(url), body: {
      "tb": table,
      "createdby": widget.username,
      "exam_code": idcontroller.text,
      "exam_desc": desccontroller.text,
    }); //sending post request with header data

    if (res.statusCode == 200) {
      print(res.body); //print raw response on console
      var data = json.decode(res.body); //decoding json to array
      if (data["error"]) {
        setState(() {
          //refresh the UI when error is recieved from server
          sending = false;
          error = true;
          msg = (data["message"]); //error message from server
        });
      } else {
        idcontroller.text = '';
        desccontroller.text = '';
        //after write success, make fields empty

        setState(() {
          sending = false;
          success = true; //mark success and refresh UI with setState
        });
      }
    } else {
      //there is error
      setState(() {
        error = true;
        msg = "Error during sending data.";
        sending = false;
        //mark error and refresh UI with setState
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Exam'),
        leading: DMenuWidget(),
      ),
      body: SingleChildScrollView(
        //enable scrolling, when keyboard appears,
        // hight becomes small, so prevent overflow
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  error ? msg : "Enter Exam Information",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                //if there is error then sho msg, other wise show text message
              ),
              Container(
                  child: TextField(
                controller: idcontroller,
                decoration: InputDecoration(
                  labelText: "Exam Id:",
                  hintText: "Enter Exam id.",
                ),
              )),
              Container(
                  child: TextField(
                controller: desccontroller,
                decoration: InputDecoration(
                  labelText: "Exam Descirption:",
                  hintText: "Enter Exam Descirption",
                ),
              )),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      //if button is pressed, setstate sending = true, so that we can show "sending..."
                      setState(() {
                        sending = true;
                      });
                      sendData();
                    },
                    child: Text(
                      sending ? "Sending..." : "SEND DATA",
                      //if sending == true then show "Sending" else show "SEND DATA";
                    ),
                    color: Colors.blue,
                    colorBrightness: Brightness.dark,
                    //background of button is darker color, so set brightness to dark
                  ),
                ),
              ),
              Container(
                child: Text(success ? "Write Success" : "send data"),
                //is there is success then show "Write Success" else show "send data"
              ),
            ],
          ),
        ),
      ),
    );
  }
}

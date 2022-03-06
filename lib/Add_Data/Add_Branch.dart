import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../General Side/theme_helper.dart';

class Add_Branch extends StatefulWidget {
  const Add_Branch({Key? key}) : super(key: key);

  @override
  _Add_BranchState createState() => _Add_BranchState();
}

class _Add_BranchState extends State<Add_Branch> {

  TextEditingController idcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();

  late bool error, sending, success;
  late String msg;
  String table = 'branch';

  @override
  void initState() {
    error = false;
    sending = false;
    success = false;
    msg = "";
    super.initState();
  }

  Future<void> sendData() async {
    var url = "http://103.141.241.97/test/insert_data.php";
    var res = await http.post(Uri.parse(url), body: {
      "table": table,
      "branch_code": idcontroller.text,
      "branch_name": namecontroller.text,
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
        namecontroller.text = '';
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
        msg = "Error during sendign data.";
        sending = false;
        //mark error and refresh UI with setState
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //enable scrolling, when keyboard appears,
        // hight becomes small, so prevent overflow
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  error ? msg : "Enter Branch Information",
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
                  labelText: "Branch Id:",
                  hintText: "Enter Branch id.",
                ),
              )),
              Container(
                  child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                  labelText: "Branch Name:",
                  hintText: "Enter Branch Name",
                ),
              )),
              Container(
                decoration:
                ThemeHelper().buttonBoxDecoration(context),
                margin: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ThemeHelper().buttonStyle(),
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

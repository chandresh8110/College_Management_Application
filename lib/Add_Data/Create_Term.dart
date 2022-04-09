// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:final_app/Developer_Team/Developer_slider/DMenuWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Create_Term extends StatefulWidget {
  const Create_Term({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<Create_Term> createState() => _Create_TermState();
}

class _Create_TermState extends State<Create_Term> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2022, 04, 08),
    end: DateTime(2022, 04, 31),
  );

  TextEditingController idcontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();

  late bool error, sending, success;
  late String msg;
  // String? startdate;
  // String? enddate;
  // String table = 'term';

  @override
  void initState() {
    error = false;
    sending = false;
    success = false;
    msg = "";
    // getterm();
    super.initState();
  }

  // Future getterm() async {
  //   var url = "http://103.141.241.97/test/getexamterm.php";
  //   final response = await http.get(Uri.parse(url));
  //   var jsonData = json.decode(response.body);
  //   setState(() {
  //     TermList = jsonData;
  //   });
  //   if (kDebugMode) {
  //     print(TermList);
  //   }
  // }

  Future<void> sendData() async {
    var url = "http://103.141.241.97/test/createterm.php";
    var res = await http.post(Uri.parse(url), body: {
      // "tb": table,
      "createdby": widget.username,
      "term_id": idcontroller.text,
      "start": dateRange.start.toString(),
      "end": dateRange.end.toString(),
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
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Term'),
        // leading: DMenuWidget(),
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
                  error ? msg : "Enter Term Information",
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
                    labelText: "Term id:",
                    hintText: "like Summer 2018, Winter 2019",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Select Starting & Ending date: -"),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          child: Text(DateFormat('dd-MM-yyyy').format(start)),
                          onPressed: pickDateRange,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          child: Text(DateFormat('dd-MM-yyyy').format(end)),
                          onPressed: pickDateRange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Term Duration: ${difference.inDays} days',
                style: TextStyle(fontSize: 15),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      print(idcontroller.text);
                      print(dateRange.start);
                      print(dateRange.end);
                      print(widget.username);
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

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(1900),
      lastDate: DateTime(3100),
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }
}

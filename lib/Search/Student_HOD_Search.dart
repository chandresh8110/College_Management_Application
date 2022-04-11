import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../General Side/theme_helper.dart';
import 'Student_Details.dart';

class Student_HOD_Search extends StatefulWidget {
  const Student_HOD_Search({Key? key, required this.username})
      : super(key: key);

  final String username;

  @override
  _Student_HOD_SearchState createState() => _Student_HOD_SearchState();
}

class _Student_HOD_SearchState extends State<Student_HOD_Search> {
  Timer? timer;
  TextEditingController idcontroller = TextEditingController();

  // Future<List> getData() async {
  //   var url = "http://103.141.241.97/test/app_profile.php";
  //   final response = await http.post(Uri.parse(url), body: {
  //     "username": idcontroller.text,
  //   });
  //   if (kDebugMode) {
  //     print(response.body);
  //   }
  //   return json.decode(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit/Delete Student"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Container(
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: idcontroller,
                decoration: ThemeHelper().textInputDecoration(
                    'Enrollment No', 'Enter Enrollment No.'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            decoration: ThemeHelper().buttonBoxDecoration(context),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ThemeHelper().buttonStyle(),
                child: Text("Search"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Student_Details(
                        username: widget.username,
                        id: idcontroller.text,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


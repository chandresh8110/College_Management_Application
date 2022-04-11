// ignore_for_file: camel_case_types, non_constant_identifier_names, unnecessary_null_comparison

import 'dart:convert';
import 'package:final_app/Profile/Faculty_Details_Page.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import '../General Side/theme_helper.dart';
import '../HOD_Side/HOD_Slider/HMenuWidget.dart';
import 'Faculty_Details.dart';

class Faculty_HOD_Search extends StatefulWidget {
  const Faculty_HOD_Search({Key? key, required this.username})
      : super(key: key);

  final String username;

  @override
  _Faculty_HOD_SearchState createState() => _Faculty_HOD_SearchState();
}

class _Faculty_HOD_SearchState extends State<Faculty_HOD_Search> {
  TextEditingController idcontroller = TextEditingController();

  // Future<List> getData() async {
  //   var url = "http://103.141.241.97/test/fac_profile.php";
  //   final response = await http.post(Uri.parse(url), body: {
  //     "username": idcontroller.text,
  //   });
  //   print(response.body);
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
                // keyboardType: TextInputType.number,
                controller: idcontroller,
                decoration: ThemeHelper().textInputDecoration(
                    'Id No', 'Enter Id No.'),
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
                      builder: (context) => Faculty_Details(
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

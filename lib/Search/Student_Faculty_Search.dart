// ignore_for_file: camel_case_types, non_constant_identifier_names, unnecessary_null_comparison

import 'dart:convert';
import 'package:final_app/Faculty%20Side/Faculty%20Slider/FMenuWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import 'Student_Details.dart';

class Student_Faculty_Search extends StatefulWidget {
  const Student_Faculty_Search({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  _Student_Faculty_SearchState createState() => _Student_Faculty_SearchState();
}

class _Student_Faculty_SearchState extends State<Student_Faculty_Search> {
  TextEditingController idcontroller = TextEditingController();

  Future<List> getData() async {
    var url = "http://103.141.241.97/test/app_profile.php";
    final response = await http.post(Uri.parse(url), body: {
      "username": idcontroller.text,
    });
    print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text('Student Search'),
        // backgroundColor: Colors.blue,
        gradient: LinearGradient(
          colors: [
            Colors.cyanAccent,
            Colors.blue,
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: idcontroller,
                decoration: InputDecoration(
                  labelText: "Enrollment No:",
                  hintText: "Enter Student's Enrollment No.",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              height: 200,
              child: FutureBuilder<List>(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    if (kDebugMode) {
                      print(snapshot.error);
                    }
                  }
                  if (snapshot.hasData) {
                    return ItemList(list: snapshot.data!, username: widget.username,);
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({Key? key, required this.list, required this.username}) : super(key: key);

  final List list;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: list == null ? 0 : list.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    "${list[i]['stu_fname']}" +
                        "  ${list[i]['stu_mname']}" +
                        "  ${list[i]['stu_lname']}",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                subtitle: Text(list[i]['stu_id']),
                leading: const Icon(
                  Icons.account_circle_outlined,
                  size: 30,
                ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Student_Details(username: '$username', id: '',),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

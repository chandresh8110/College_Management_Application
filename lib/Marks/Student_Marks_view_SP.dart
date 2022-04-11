import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../General Side/theme_helper.dart';

class Student_Marks_view_SP extends StatefulWidget {
  const Student_Marks_view_SP({
    Key? key,
    required this.username,
    required this.exam_code,
  }) : super(key: key);

  final String username;
  final String exam_code;

  @override
  State<Student_Marks_view_SP> createState() => _Student_Marks_view_SPState();
}

class _Student_Marks_view_SPState extends State<Student_Marks_view_SP> {
  bool loading = true;
  List? Attendence;

  void viewMarks() async {
    var url = "http://103.141.241.97/test/viewmark.php";
    final response = await http.post(Uri.parse(url), body: {
      'id': widget.username,
      'exam_code': widget.exam_code,
    });
    var jsonData = json.decode(response.body);
    setState(() {
      Attendence = jsonData;
      loading = false;
    });
    if (kDebugMode) {
      print(Attendence);
    }
  }

  @override
  void initState() {
    viewMarks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Exam Marks'),
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
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: Attendence!.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                            child: ListTile(
                              title: Text("Sub. Code:- " +
                                  "${Attendence![i]["cid"]}"),
                              subtitle: Text("Marks:- " +
                                  "${Attendence![i]["mark"]}",
                              style: TextStyle(fontSize: 18),),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}

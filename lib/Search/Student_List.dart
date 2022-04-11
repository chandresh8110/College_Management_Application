import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../General Side/theme_helper.dart';

class Student_List extends StatefulWidget {
  const Student_List({Key? key, required this.branch, required this.sem})
      : super(key: key);

  final String branch;
  final String sem;

  @override
  State<Student_List> createState() => _Student_ListState();
}

class _Student_ListState extends State<Student_List> {
  Timer? timer;
  bool loading = true;
  List? studentList;
  String table = 'student';

  Future fetchAllstudent() async {
    var url = 'http://103.141.241.97/test/view_faculty.php';
    var response = await http.post(Uri.parse(url), body: {
      "tb": table,
      "branch": widget.branch,
      "sem": widget.sem,
    });
    if (response.statusCode == 200) {
      setState(() {
        studentList = jsonDecode(response.body);
        loading = false;
      });
      if (kDebugMode) {
        print(studentList);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAllstudent();
    timer = Timer.periodic(
        const Duration(seconds: 55), (Timer t) => fetchAllstudent());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.branch),
        // backgroundColor: Colors.blue,
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
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
            children: [
              Flexible(
                child: ListView.builder(
                    itemCount: studentList!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ListTile(
                            title: Text(
                              "${studentList![index]['stu_fname']}" +
                                  "  ${studentList![index]['stu_mname']}" +
                                  "  ${studentList![index]['stu_lname']}",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            subtitle: Text(studentList![index]['stu_id']),
                            leading: Container(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage:AssetImage(
                                        "images/Logo_.png"
                                    ),
                                    foregroundImage: NetworkImage(
                                      "http://103.141.241.97/test/uploads/Student/${studentList![index]["stu_pic"]}",
                                    ),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              ),
            ],
          ),
    );
  }
}

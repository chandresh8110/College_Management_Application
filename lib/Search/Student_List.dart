import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Student_List extends StatefulWidget {
  const Student_List({Key? key, required this.branch, required this.year})
      : super(key: key);

  final String branch;
  final String year;

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
      "year": widget.year,
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
                Colors.cyanAccent,
                Colors.blue,
              ],
            ),
          ),
        ),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: studentList!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "${studentList![index]['stu_fname']}" +
                          "  ${studentList![index]['stu_mname']}" +
                          "  ${studentList![index]['stu_lname']}",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  subtitle: Text(studentList![index]['stu_id']),
                  leading: const Icon(
                    Icons.account_circle_outlined,
                    size: 30,
                  ),
                );
              },
            ),
    );
  }
}

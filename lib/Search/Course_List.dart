import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Course_List extends StatefulWidget {
  const Course_List(
      {Key? key, required this.branch, required this.year, required this.sem})
      : super(key: key);

  final String branch;
  final String year;
  final String sem;

  @override
  State<Course_List> createState() => _Course_ListState();
}

class _Course_ListState extends State<Course_List> {
  Timer? timer;
  bool loading = true;
  List? courseList;
  String table = 'course';

  Future fetchAllcourse() async {
    var url = 'http://103.141.241.97/test/view_faculty.php';
    var response = await http.post(Uri.parse(url), body: {
      "tb": table,
      "branch": widget.branch,
      "sem": widget.sem,
      "year": widget.year,
    });
    if (response.statusCode == 200) {
      setState(() {
        courseList = jsonDecode(response.body);
        loading = false;
      });
      if (kDebugMode) {
        print(courseList);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAllcourse();
    timer = Timer.periodic(
        const Duration(seconds: 55), (Timer t) => fetchAllcourse());
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
              itemCount: courseList!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "${courseList![index]['cname']}",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  subtitle: Text(courseList![index]['cid']),
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

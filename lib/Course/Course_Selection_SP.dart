// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Course_Selection_SP extends StatefulWidget {
  const Course_Selection_SP({
    Key? key,
    required this.branch,
    required this.sem,
    required this.username,
    required this.year,
    required this.term,
  }) : super(key: key);

  final String branch;
  final String term;
  final String sem;
  final String username;
  final String year;

  @override
  State<Course_Selection_SP> createState() => _Course_Selection_SPState();
}

class _Course_Selection_SPState extends State<Course_Selection_SP> {
  String? stu_Er;
  List? ListEr;
  String table = "course";
  bool loading = true;

  Future<List> fetchcid() async {
    var url = "http://103.141.241.97/test/selectcourse.php";
    final response = await http.post(Uri.parse(url), body: {
      'sem': widget.sem,
      'branch': widget.branch,
      'year' : widget.year,
    });
    if (kDebugMode) {
      print(response.body);
    }
    var jsonData = json.decode(response.body);
    setState(() {
      ListEr = jsonData;
      loading = false;
    });
    return json.decode(response.body);
  }

  final ser = [];

  void post() async {
    var url = "http://103.141.241.97/test/insert_data.php";
    final response = await http.post(
      Uri.parse(url),
      body: {
        'cid': stu_Er,
        'table': table,
        'branch': widget.branch,
        'sem': widget.sem,
        'term': widget.term,
        'year': widget.year,
      },
    );
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }
    }
  }

  @override
  void initState() {
    fetchcid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Subject'),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: ListEr?.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      // checkColor: Colors.yellow,
                      title: Text(ListEr![index]["cname"]),
                      value: ser.contains(ListEr![index]["cid"]),
                      onChanged: (value) {
                        if (ser.contains(ListEr![index]["cid"])) {
                          ser.remove(ListEr![index]["cid"]);
                        } else {
                          ser.add(ListEr![index]["cid"]);
                        }
                        setState(() {
                          stu_Er = '$ser';
                          if (kDebugMode) {
                            print(stu_Er);
                          }
                        });
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: MaterialButton(
                      color: Colors.grey,
                      onPressed: () {
                        post();
                        Navigator.of(context).pop();
                      },
                      child: const Text("Okay"),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

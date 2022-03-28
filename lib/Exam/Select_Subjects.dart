// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Select_Subject extends StatefulWidget {
  const Select_Subject({
    Key? key,
    required this.year,
    required this.branch,
    required this.sem,
    required this.username,
    required this.examcode,
  }) : super(key: key);

  final String year;
  final String branch;
  final String sem;
  final String username;
  final String examcode;

  @override
  State<Select_Subject> createState() => _Select_SubjectState();
}

class _Select_SubjectState extends State<Select_Subject> {
  String? stu_Er;
  List? ListEr;
  String table = "Exam_sub";
  bool loading = true;

  Future<List> fetchcid() async {
    var url = "http://103.141.241.97/test/getcourse.php";
    final response = await http.post(Uri.parse(url), body: {
      'sem': widget.sem,
      'branch': widget.branch,
      'year': widget.year,
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
    var url = "http://103.141.241.97/test/exam.php";
    final response = await http.post(
      Uri.parse(url),
      body: {
        'cid': stu_Er,
        'tb': table,
        'branch': widget.branch,
        'sem': widget.sem,
        'createdby': widget.username,
        'exam_code': widget.examcode,
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

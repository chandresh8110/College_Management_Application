// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';

import 'package:final_app/Marks/Student_Marks_view_SP.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../General Side/theme_helper.dart';

class Student_Marks_view extends StatefulWidget {
  const Student_Marks_view({Key? key, required this.username})
      : super(key: key);

  final String username;

  @override
  State<Student_Marks_view> createState() => _Student_Marks_viewState();
}

class _Student_Marks_viewState extends State<Student_Marks_view> {
  String? selectedExam;
  List? ExamList;
  bool loading = true;

  Future getexam() async {
    var url = "http://103.141.241.97/test/getexamcode.php";
    final response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    setState(() {
      ExamList = jsonData;
      loading = false;
    });
    if (kDebugMode) {
      print(ExamList);
    }
  }

  @override
  void initState() {
    getexam();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Marks'),
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
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.grey),
                      color: Colors.white,
                    ),
                    child: DropdownButton(
                        isExpanded: true,
                        hint: const Text('Select Exam ID'),
                        value: selectedExam,
                        items: ExamList!.map((Exam) {
                          return DropdownMenuItem(
                            value: Exam['exam_code'],
                            child: Text(Exam['exam_code']),
                          );
                        }).toList(),
                        underline: Container(
                          height: 0.1,
                          // color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (Exam) {
                          setState(() {
                            selectedExam = Exam.toString();
                            print(selectedExam);
                          });
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: ThemeHelper().buttonBoxDecoration(context),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ThemeHelper().buttonStyle(),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Student_Marks_view_SP(
                                username: widget.username,
                                exam_code: '$selectedExam',
                              ),
                            ),
                          );
                        },
                        child: const Text('Ok'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

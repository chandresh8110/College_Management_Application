// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:final_app/Exam/Select_Subjects.dart';
import 'package:final_app/slider/MenuWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Select_Exam_Sub extends StatefulWidget {
  const Select_Exam_Sub({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<Select_Exam_Sub> createState() => _Select_Exam_SubState();
}

class _Select_Exam_SubState extends State<Select_Exam_Sub> {
  String? semValue;
  String? selectedBranch;
  List? BranchitemList;
  String? selectedExam;
  List? ExamList;
  String? selectedyear;
  List? YearList;

  Future getbrach() async {
    var url = "http://103.141.241.97/test/getbranch.php";
    final response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    setState(() {
      BranchitemList = jsonData;
    });
    if (kDebugMode) {
      print(BranchitemList);
    }
  }

  Future getexam() async {
    var url = "http://103.141.241.97/test/getexamcode.php";
    final response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    setState(() {
      ExamList = jsonData;
    });
    if (kDebugMode) {
      print(ExamList);
    }
  }

  Future getyear() async {
    var url = "http://103.141.241.97/test/getyear.php";
    final response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    setState(() {
      YearList = jsonData;
    });
    if (kDebugMode) {
      print(YearList);
    }
  }

  // void post() async {
  //   var url = "http://103.141.241.97/test/.php";
  //   final response = await http.post(
  //     Uri.parse(url),
  //     body: {
  //       "sem": semValue,
  //       "branch": selectedBranch,
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     if (kDebugMode) {
  //       print(response.body);
  //     }
  //   }
  // }

  @override
  void initState() {
    getyear();
    getbrach();
    getexam();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Subject for Exam'),
        leading: MenuWidget(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                  items: ExamList?.map((Exam) {
                    return DropdownMenuItem(
                        value: Exam['exam_code'],
                        child: Text(Exam['exam_code']));
                  }).toList(),
                  onChanged: (Exam) {
                    setState(() {
                      selectedExam = Exam.toString();
                      print(selectedExam);
                    });
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              ),
              child: DropdownButton(
                  isExpanded: true,
                  hint: const Text('Select Year'),
                  value: selectedyear,
                  items: YearList?.map((course) {
                    return DropdownMenuItem(
                        value: course['year'], child: Text(course['year']));
                  }).toList(),
                  onChanged: (year) {
                    setState(() {
                      selectedyear = year.toString();
                      print(selectedyear);
                    });
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              ),
              child: DropdownButton(
                  isExpanded: true,
                  hint: const Text('Select Branch'),
                  value: selectedBranch,
                  items: BranchitemList?.map((branch) {
                    return DropdownMenuItem(
                        value: branch['branch_name'],
                        child: Text(branch['branch_name']));
                  }).toList(),
                  onChanged: (branch) {
                    setState(() {
                      selectedBranch = branch.toString();
                      print(selectedBranch);
                    });
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              ),
              child: DropdownButton<String>(
                hint: Text('Select Sem'),
                value: semValue,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                // style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 0.1,
                  // color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    semValue = newValue!;
                  });
                },
                items: <String>['1', '2', '3', '4', '5', '6', '7', '8']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Colors.red,
              onPressed: () {
                // post();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Select_Subject(
                      year: '$selectedyear',
                      branch: '$selectedBranch',
                      sem: '$semValue',
                      username: widget.username,
                      examcode: '$selectedExam',
                    ),
                  ),
                ).then((value) => setState(() {
                  selectedBranch = value;
                  semValue = value;
                  selectedExam = value;
                  selectedyear = value;
                }));
              },
              child: const Text("OKAY"),
            ),
          ),
        ],
      ),
    );
  }
}

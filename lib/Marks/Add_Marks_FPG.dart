// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';
import 'package:final_app/HOD_Side/HOD_Slider/HMenuWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../General Side/theme_helper.dart';
import 'Add_Marks_SP.dart';

class Add_Marks_FP extends StatefulWidget {
  const Add_Marks_FP({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<Add_Marks_FP> createState() => _Add_Marks_FPState();
}

class _Add_Marks_FPState extends State<Add_Marks_FP> {
  String? selectedExam;
  List? ExamList;
  String? table = "branch";

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

  @override
  void initState() {
    getexam();
    super.initState();
  }

  Future<List> getbranch() async {
    var url = "http://103.141.241.97/test/exam.php";
    final response = await http.post(Uri.parse(url), body: {
      'tb': table,
      'exam_code': '$selectedExam',
    });
    if (kDebugMode) {
      print(response.body);
    }
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add_Marks_FP'),
        leading: HMenuWidget(
          username: widget.username,
        ),
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
          Flexible(
            child: FutureBuilder<List>(
              future: getbranch(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  if (kDebugMode) {
                    print(snapshot.error);
                  }
                }
                if (snapshot.hasData) {
                  return GetBranch(
                    list: snapshot.data!,
                    Exam_id: '$selectedExam',
                    username: widget.username,
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GetBranch extends StatefulWidget {
  const GetBranch(
      {Key? key,
      required this.list,
      required this.Exam_id,
      required this.username})
      : super(key: key);

  final List list;
  final String Exam_id;
  final String username;

  @override
  State<GetBranch> createState() => _GetBranchState();
}

class _GetBranchState extends State<GetBranch> {
  String? selectedBranch;
  String? table = "sem";

  Future<List> getsem() async {
    var url = "http://103.141.241.97/test/exam.php";
    final response = await http.post(Uri.parse(url), body: {
      'tb': table,
      'exam_code': widget.Exam_id,
      'branch': '$selectedBranch',
    });
    if (kDebugMode) {
      print(response.body);
    }
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                // menuMaxHeight: 5000,
                isExpanded: true,
                hint: const Text('Select Branch'),
                value: selectedBranch,
                items: widget.list.map((branch) {
                  return DropdownMenuItem(
                    value: branch['branch'],
                    child: Text(branch['branch']),
                  );
                }).toList(),
                onChanged: (branch) {
                  setState(() {
                    selectedBranch = branch.toString();
                    print(selectedBranch);
                  });
                }),
          ),
        ),
        Flexible(
          child: FutureBuilder<List>(
            future: getsem(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                if (kDebugMode) {
                  print(snapshot.error);
                }
              }
              if (snapshot.hasData) {
                return GetSem(
                  Exam_id: widget.Exam_id,
                  Branch: '$selectedBranch',
                  list: snapshot.data!,
                  username: widget.username,
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ],
    );
  }
}

class GetSem extends StatefulWidget {
  const GetSem({
    Key? key,
    required this.Exam_id,
    required this.Branch,
    required this.list,
    required this.username,
  }) : super(key: key);

  final String Exam_id;
  final String Branch;
  final List list;
  final String username;

  @override
  State<GetSem> createState() => _GetSemState();
}

class _GetSemState extends State<GetSem> {
  String? selectedSem;
  String? table = "Marks";

  Future<List> getcourse() async {
    var url = "http://103.141.241.97/test/exam.php";
    final response = await http.post(Uri.parse(url), body: {
      'exam_code': widget.Exam_id,
      'branch': widget.Branch,
      'sem': '$selectedSem',
      'tb': table,
    });
    if (kDebugMode) {
      print(response.body);
    }
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                hint: const Text('Select Sem'),
                value: selectedSem,
                items: widget.list.map((sem) {
                  return DropdownMenuItem(
                    value: sem['sem'],
                    child: Text(sem['sem']),
                  );
                }).toList(),
                onChanged: (branch) {
                  setState(() {
                    selectedSem = branch.toString();
                    print(selectedSem);
                  });
                }),
          ),
        ),
        Flexible(
          child: FutureBuilder<List>(
            future: getcourse(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                if (kDebugMode) {
                  print(snapshot.error);
                }
              }
              if (snapshot.hasData) {
                return Getcid(
                  Exam_id: widget.Exam_id,
                  Branch: widget.Branch,
                  Sem: '$selectedSem',
                  list: snapshot.data!,
                  username: widget.username,
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ],
    );
  }
}

class Getcid extends StatefulWidget {
  const Getcid({
    Key? key,
    required this.Exam_id,
    required this.Branch,
    required this.Sem,
    required this.list,
    required this.username,
  }) : super(key: key);

  final String Exam_id;
  final String Branch;
  final String Sem;
  final List list;
  final String username;

  @override
  State<Getcid> createState() => _GetcidState();
}

class _GetcidState extends State<Getcid> {
  String? selectedSubject;

  String? exam_code;
  String? sem;
  String? branch;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                hint: const Text('Select Subject'),
                value: selectedSubject,
                items: widget.list.map((branch) {
                  return DropdownMenuItem(
                    value: branch['cid'],
                    child: Text(
                      branch['cid'],
                    ),
                  );
                }).toList(),
                onChanged: (branch) {
                  setState(() {
                    selectedSubject = branch.toString();
                    print(selectedSubject);
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
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => Add_Marks_SP(
                            exam_id: widget.Exam_id,
                            cid: '$selectedSubject',
                            username: widget.username,
                            sem: widget.Sem,
                            branch: widget.Branch,
                          ),
                        ),
                      )
                      .then(
                        (value) => setState(
                          () {
                            selectedSubject = value;
                          },
                        ),
                      );
                },
                child: const Text('Ok'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

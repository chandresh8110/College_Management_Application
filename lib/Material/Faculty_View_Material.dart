// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:final_app/Faculty%20Side/Faculty%20Slider/FMenuWidget.dart';
import 'package:final_app/Material/Faculty_Add_Material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Material_List.dart';

class Faculty_View_Material extends StatefulWidget {
  const Faculty_View_Material({Key? key, required this.username})
      : super(key: key);

  final String username;

  @override
  _Faculty_View_MaterialState createState() => _Faculty_View_MaterialState();
}

class _Faculty_View_MaterialState extends State<Faculty_View_Material> {
  String? selectedBranch;
  List? BranchitemList;
  String? selectedSem;
  String? selectedyear;
  List? YearList;
  Timer? timer;

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

  Future getdata() async {
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

  @override
  void initState() {
    getyear();
    getdata();
    super.initState();
  }

  Future<List> post() async {
    var url = "http://103.141.241.97/test/getcourse.php";
    final response = await http.post(Uri.parse(url), body: {
      'sem': selectedSem,
      'branch': selectedBranch,
      'year': selectedyear,
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
        title: const Text('Materials'),
        backgroundColor: Colors.blue,
        leading: FMenuWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
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
            Padding(
              padding: const EdgeInsets.all(10.0),
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButton(
                isExpanded: true,
                hint: const Text('Select Sem'),
                // Initial Value
                value: selectedSem,

                // Down Arrow Icon
                icon: const Icon(Icons.arrow_drop_down),
                // Array list of items
                items: <String>[
                  '1',
                  '2',
                  '3',
                  '4',
                  '5',
                  '6',
                  '7',
                  '8',
                ].map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (sem) {
                  setState(() {
                    selectedSem = sem.toString();
                    if (kDebugMode) {
                      print(selectedSem);
                    }
                  });
                },
              ),
            ),
            FutureBuilder<List>(
                future: post(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    if (kDebugMode) {
                      print(snapshot.error);
                    }
                  }
                  if (snapshot.hasData) {
                    return CourseList(
                      list: snapshot.data!,
                      sem: '$selectedSem',
                      branch: '$selectedBranch',
                      year: '$selectedyear',
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => Faculty_Add_Material(
                        username: widget.username,
                      )),
            );
          });
        },
      ),
    );
  }
}

class CourseList extends StatefulWidget {
  const CourseList(
      {Key? key,
      required this.list,
      required this.sem,
      required this.branch,
      required this.year})
      : super(key: key);

  final List list;
  final String sem;
  final String branch;
  final String year;

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  String? selectedCourse;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButton(
                menuMaxHeight: 5000,
                isExpanded: true,
                hint: const Text('Select Course'),
                value: selectedCourse,
                items: widget.list.map((course) {
                  return DropdownMenuItem(
                      value: course['course_name'],
                      child: Text(course['course_name']));
                }).toList(),
                onChanged: (course) {
                  setState(() {
                    selectedCourse = course.toString();
                    if (kDebugMode) {
                      print(selectedCourse);
                    }
                  });
                }),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                        builder: (context) => Material_list(
                              branch: widget.branch,
                              course: '$selectedCourse',
                              sem: widget.sem,
                              year: widget.year,
                            )),
                  )
                  .then((value) => setState(() {
                        selectedCourse = value;
                      }));
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}

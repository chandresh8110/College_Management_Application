// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';
import 'package:final_app/Course/Course_Selection_SP.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../General Side/theme_helper.dart';

class Course_Selection_FP extends StatefulWidget {
  const Course_Selection_FP({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<Course_Selection_FP> createState() => _Course_Selection_FPState();
}

class _Course_Selection_FPState extends State<Course_Selection_FP> {
  String? semValue;
  String? selectedBranch;
  List? BranchitemList;
  String? selectedYear;
  List? YearList;
  String? selectedTerm;
  List? TermList;


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

  Future getYear() async {
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

  Future getTerm() async {
    var url = "http://103.141.241.97/test/getallterm.php";
    final response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    setState(() {
      TermList = jsonData;
    });
    if (kDebugMode) {
      print(TermList);
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
    getbrach();
    getYear();
    getTerm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Subject for Current Term'),
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
                  hint: const Text('Select Year'),
                  value: selectedYear,
                  items: YearList?.map((Year) {
                    return DropdownMenuItem(
                        value: Year['year'],
                        child: Text(Year['year']));
                  }).toList(),
                  underline: Container(
                    height: 0.1,
                    // color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (Year) {
                    setState(() {
                      selectedYear = Year.toString();
                      print(selectedYear);
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
                  hint: const Text('Select Term'),
                  value: selectedTerm,
                  items: TermList?.map((Term) {
                    return DropdownMenuItem(
                        value: Term['term'],
                        child: Text(Term['term']));
                  }).toList(),
                  underline: Container(
                    height: 0.1,
                    // color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (Term) {
                    setState(() {
                      selectedTerm = Term.toString();
                      print(selectedTerm);
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
                  underline: Container(
                    height: 0.1,
                    // color: Colors.deepPurpleAccent,
                  ),
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
            child: Container(
              decoration: ThemeHelper().buttonBoxDecoration(context),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  onPressed: () {
                    // post();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Course_Selection_SP(
                          branch: '$selectedBranch',
                          term : '$selectedTerm',
                          sem: '$semValue',
                          username: widget.username,
                          year: '$selectedYear',
                        ),
                      ),
                    ).then((value) => setState(() {
                      selectedBranch = value;
                      semValue = value;
                      selectedYear = value;
                      selectedTerm = value;
                    }));
                  },
                  child: const Text("OKAY"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

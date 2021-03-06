import 'dart:convert';
import 'package:final_app/Search/Faculty_List.dart';
import 'package:final_app/slider/SliderDrawer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../General Side/theme_helper.dart';
import 'Course_List.dart';

class Course_Search_List extends StatefulWidget {
  const Course_Search_List({Key? key}) : super(key: key);

  @override
  State<Course_Search_List> createState() => _Course_Search_ListState();
}

class _Course_Search_ListState extends State<Course_Search_List> {
  String? selectedBranch;
  List? BranchitemList;
  String? selectedTerm;
  List? TermList;
  String? semValue;

  Future getyear() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course'),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
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
                  items: TermList?.map((course) {
                    return DropdownMenuItem(
                      value: course['term'],
                      child: Text(
                        course['term'],
                      ),
                    );
                  }).toList(),
                  underline: Container(
                    height: 0.1,
                    // color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (year) {
                    setState(() {
                      selectedTerm = year.toString();
                      print(selectedTerm);
                    });
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
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
            padding: const EdgeInsets.all(10.0),
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
            padding: const EdgeInsets.all(10.0),
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
                            builder: (context) => Course_List(
                              branch: "$selectedBranch",
                              sem: "$semValue",
                              term: "$selectedTerm",
                            ),
                          ),
                        )
                        .then((value) => setState(() {
                              selectedBranch = value;
                              semValue = value;
                              selectedTerm = value;
                            }));
                  },
                  child: Text('OK'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

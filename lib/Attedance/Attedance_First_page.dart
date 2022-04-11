import 'dart:convert';

import 'package:final_app/Attedance/Attedance_Second_page.dart';
import 'package:final_app/HOD_Side/HOD_Slider/HMenuWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../General Side/theme_helper.dart';

class attendence extends StatefulWidget {
  const attendence({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<attendence> createState() => _attendenceState();
}

class _attendenceState extends State<attendence> {
  String? selectedTerm;
  List? TermList;
  String? selectedBranch;
  List? BranchitemList;
  String? selectedSem;

  Future getterm() async {
    var url = "http://103.141.241.97/test/getexamterm.php";
    final response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    setState(() {
      TermList = jsonData;
    });
    if (kDebugMode) {
      print(TermList);
    }
  }

  Future getbranch() async {
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

  Future<List> getcourse() async {
    var url = "http://103.141.241.97/test/getattendancecourse.php";
    final response = await http.post(Uri.parse(url), body: {
      'sem': selectedSem,
      'branch': selectedBranch,
      'term': selectedTerm,
    });
    if (kDebugMode) {
      print(response.body);
    }
    return json.decode(response.body);
  }

  @override
  void initState() {
    getbranch();
    getterm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Attendence"),
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
                  hint: const Text('Select term'),
                  value: selectedTerm,
                  items: TermList?.map((term) {
                    return DropdownMenuItem(
                      value: term['term'],
                      child: Text(
                        term['term'],
                      ),
                    );
                  }).toList(),
                  underline: Container(
                    height: 0.1,
                    // color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (branch) {
                    setState(() {
                      selectedTerm = branch.toString();
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
                      child: Text(
                        branch['branch_name'],
                      ),
                    );
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
              child: DropdownButton(
                isExpanded: true,
                hint: const Text('Select Sem'),
                // Initial Value
                value: selectedSem,
                // Down Arrow Icon
                icon: const Icon(Icons.arrow_drop_down),
                // Array list of items
                items: <String>['1', '2', '3', '4', '5', '6', '7', '8']
                    .map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                underline: Container(
                  height: 0.1,
                  // color: Colors.deepPurpleAccent,
                ),
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
                  return course(
                    list: snapshot.data!,
                    term: '$selectedTerm',
                    username: widget.username,
                    sem: '$selectedSem',
                    branch: '$selectedBranch',
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

class course extends StatefulWidget {
  const course({
    Key? key,
    required this.term,
    required this.branch,
    required this.sem,
    required this.list,
    required this.username,
  }) : super(key: key);

  final List list;
  final String term;
  final String branch;
  final String sem;
  final String username;

  @override
  State<course> createState() => _courseState();
}

class _courseState extends State<course> {
  String? selectedCourse;
  String? selectedtype;
  String? lec;

  Future<List> post() async {
    var url = "http://103.141.241.97/test/atten.php";
    final response = await http.post(Uri.parse(url), body: {
      'sem': widget.sem,
      'branch': widget.branch,
      'type': '$selectedtype',
    });
    if (kDebugMode) {
      print(response.body);
    }
    return json.decode(response.body);
  }

  Map<String, bool> numbers = {
    "1": false,
    "2": false,
    "3": false,
    "4": false,
    "5": false,
    "6": false,
  };

  var holder = [];

  getItems() {
    numbers.forEach((key, value) {
      if (value == true) {
        holder.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    // print(holder);
    print(holder);

    lec = "$holder";
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    holder.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                  hint: const Text('Select Course'),
                  value: selectedCourse,
                  items: widget.list.map((branch) {
                    return DropdownMenuItem(
                      value: branch['cname'],
                      child: Text(branch['cname']),
                    );
                  }).toList(),
                  underline: Container(
                    height: 0.1,
                    // color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (branch) {
                    setState(() {
                      selectedCourse = branch.toString();
                      print(selectedCourse);
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
                hint: const Text('Lecture Type'),
                // Initial Value
                value: selectedtype,
                // Down Arrow Icon
                icon: const Icon(Icons.arrow_drop_down),
                // Array list of items
                items: <String>['Lecture', 'Lab(A)', 'Lab(B)', 'Lab(C)']
                    .map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                underline: Container(
                  height: 0.1,
                  // color: Colors.deepPurpleAccent,
                ),
                onChanged: (sem) {
                  setState(() {
                    selectedtype = sem.toString();
                    if (kDebugMode) {
                      print(selectedtype);
                    }
                  });
                },
              ),
            ),
          ),
          ListView(
            shrinkWrap: true,
            // scrollDirection: Axis.horizontal,
            children: numbers.keys.map((String key) {
              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(key),
                value: numbers[key],
                activeColor: Colors.lightBlueAccent,
                checkColor: Colors.lightGreenAccent,
                onChanged: (value) {
                  setState(() {
                    numbers[key] = value!;
                    // holder = value as List;
                  });
                },
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: ThemeHelper().buttonBoxDecoration(context),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Text(
                    " Get Student List ",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    // print(getItems());
                    // print(holder);
                    print(lec);
                    post();
                    Navigator.of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (context) => Attedance_second_page(
                              sem: widget.sem,
                              branch: widget.branch,
                              username: widget.username,
                              term: widget.term,
                              type: '$selectedtype',
                              sub: '$selectedCourse',
                              lec: '$lec',
                            ),
                          ),
                        )
                        .then((value) => setState(() {}));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

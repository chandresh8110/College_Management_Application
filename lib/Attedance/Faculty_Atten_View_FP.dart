import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../General Side/theme_helper.dart';
import 'Faculty_Atten_View_SP.dart';

class Faculty_Atten_View_FP extends StatefulWidget {
  const Faculty_Atten_View_FP({Key? key, required this.username})
      : super(key: key);

  final String username;
  @override
  _Faculty_Atten_View_FPState createState() => _Faculty_Atten_View_FPState();
}

class _Faculty_Atten_View_FPState extends State<Faculty_Atten_View_FP> {
  String? selectedBranch;
  List? BranchitemList;
  String? selectedSem;
  String? selectedterm;
  List? termList;
  Timer? timer;

  Future getterm() async {
    var url = "http://103.141.241.97/test/getallterm.php";
    final response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    setState(() {
      termList = jsonData;
    });
    if (kDebugMode) {
      print(termList);
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
    getterm();
    getdata();
    super.initState();
  }

  Future<List> post() async {
    var url = "http://103.141.241.97/test/fac_stuattendlist.php";
    final response = await http.post(Uri.parse(url), body: {
      'sem': selectedSem,
      'branch': selectedBranch,
      "term": selectedterm,
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
        title: const Text('View Attendance'),
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
        // leading: SMenuWidget(
        //   username: widget.username,
        // ),
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
                  value: selectedterm,
                  items: termList?.map((term) {
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
                  onChanged: (term) {
                    setState(
                      () {
                        selectedterm = term.toString();
                        print(selectedterm);
                      },
                    );
                  },
                ),
              )),
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
                  term: '$selectedterm',
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
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
      required this.term})
      : super(key: key);

  final List? list;
  final String sem;
  final String branch;
  final String term;

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  String? selectedCourse;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: widget.list!.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: ThemeHelper().buttonBoxDecoration(context),
                      child: ListTile(
                        title: Text(widget.list![i]["stu_id"]),
                        subtitle: Text("Attendance:- " +
                            "${widget.list![i]["percentage"]}" +
                            "%"),
                        leading: const Icon(Icons.account_circle_outlined),
                        onTap: () {
                          // getdata();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Faculty_Atten_View_SP(
                                branch: widget.branch,
                                term: widget.term,
                                sem: widget.sem,
                                id: widget.list![i]["stu_id"],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';
import 'dart:convert';
import 'package:final_app/Marks/Faculty_Marks_view_SP.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Faculty_Marks_view_FP extends StatefulWidget {
  const Faculty_Marks_view_FP({Key? key, required this.username}) : super(key: key);


  final String username;

  @override
  _Faculty_Marks_view_FPState createState() => _Faculty_Marks_view_FPState();
}

class _Faculty_Marks_view_FPState extends State<Faculty_Marks_view_FP> {
  String? selectedBranch;
  List? BranchitemList;
  String? selectedSem;
  String? selectedexam_code;
  List? exam_codeList;
  Timer? timer;

  Future getexamcode() async {
    var url = "http://103.141.241.97/test/getexamcode.php";
    final response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    setState(() {
      exam_codeList = jsonData;
    });
    if (kDebugMode) {
      print(exam_codeList);
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
    getexamcode();
    getdata();
    super.initState();
  }

  Future<List> post() async {
    var url = "http://103.141.241.97/test/view_facmark.php";
    final response = await http.post(Uri.parse(url), body: {
      'sem': selectedSem,
      'branch': selectedBranch,
      "exam_code": selectedexam_code,
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
        title: const Text('View Marks'),
        // backgroundColor: Colors.blue,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.cyanAccent,
                Colors.blue,
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
                  hint: const Text('Select Exam Code'),
                  value: selectedexam_code,
                  items: exam_codeList?.map((exam_code) {
                    return DropdownMenuItem(
                      value: exam_code['exam_code'],
                      child: Text(
                        exam_code['exam_code'],
                      ),
                    );
                  }).toList(),
                  onChanged: (exam_code) {
                    setState(
                          () {
                        selectedexam_code = exam_code.toString();
                        print(selectedexam_code);
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
                  term: '$selectedexam_code',
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
    return SizedBox(
      height: 505,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: widget.list!.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(widget.list![i]["stu_id"]),
                      leading: const Icon(Icons.account_circle_outlined),
                      onTap: () {
                        // getdata();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => Faculty_Marks_view_SP(
                              branch: widget.branch,
                              exam_code: widget.term,
                              sem: widget.sem,
                              id: widget.list![i]["stu_id"],
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

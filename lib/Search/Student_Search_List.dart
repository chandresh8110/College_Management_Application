import 'dart:convert';
import 'package:final_app/slider/SliderDrawer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../General Side/theme_helper.dart';
import 'Student_List.dart';

class Student_Search_List extends StatefulWidget {
  const Student_Search_List({Key? key}) : super(key: key);

  @override
  State<Student_Search_List> createState() => _Student_Search_ListState();
}

class _Student_Search_ListState extends State<Student_Search_List> {
  String? selectedBranch;
  List? BranchitemList;
  String? semValue;
  // List? YearList;

  // Future getyear() async {
  //   var url = "http://103.141.241.97/test/getyear.php";
  //   final response = await http.get(Uri.parse(url));
  //   var jsonData = json.decode(response.body);
  //   setState(() {
  //     YearList = jsonData;
  //   });
  //   if (kDebugMode) {
  //     print(YearList);
  //   }
  // }

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
    // getyear();
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Student"),
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
          Container(
            margin: EdgeInsets.all(10),
            decoration: ThemeHelper().buttonBoxDecoration(context),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ThemeHelper().buttonStyle(),
                onPressed: () {
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => Student_List(
                            branch: "$selectedBranch",
                            sem: '$semValue',
                          ),
                        ),
                      )
                      .then((value) => setState(() {
                            selectedBranch = value;
                            semValue = value;
                          }));
                },
                child: Text('OK'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

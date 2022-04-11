import 'dart:convert';
import 'package:final_app/Search/Faculty_List.dart';
import 'package:final_app/slider/SliderDrawer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../General Side/theme_helper.dart';

class Faculty_Search_List extends StatefulWidget {
  const Faculty_Search_List({Key? key}) : super(key: key);

  @override
  State<Faculty_Search_List> createState() => _Faculty_Search_ListState();
}

class _Faculty_Search_ListState extends State<Faculty_Search_List> {
  String? selectedBranch;
  List? BranchitemList;

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
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty Search'),
        // backgroundColor: Colors.blue,
        flexibleSpace: Container(
          decoration: BoxDecoration(
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
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(top: 20),
              decoration: ThemeHelper().buttonBoxDecoration(context),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  onPressed: () {
                    Navigator.of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (context) => Faculty_List(
                              branch: "$selectedBranch",
                            ),
                          ),
                        )
                        .then((value) => setState(() {
                              selectedBranch = value;
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

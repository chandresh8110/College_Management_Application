import 'dart:convert';
import 'package:final_app/Search/Faculty_List.dart';
import 'package:final_app/slider/SliderDrawer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Faculty'),
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
            ElevatedButton(
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
          ],
        ),
      ),
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SliderDrawer(),
          ),
        );
        return false;
      },
    );
  }
}

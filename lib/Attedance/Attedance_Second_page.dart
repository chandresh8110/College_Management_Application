// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Attedance_second_page extends StatefulWidget {
  const Attedance_second_page({
    Key? key,
    required this.lec,
    required this.branch,
    required this.sem,
    required this.username,
    required this.term,
    required this.type,
    required this.sub,
  }) : super(key: key);

  final String sub;
  final String branch;
  final String sem;
  final String username;
  final String term;
  final String type;
  final String lec;

  @override
  State<Attedance_second_page> createState() => _Attedance_second_pageState();
}

class _Attedance_second_pageState extends State<Attedance_second_page> {
  String? stu_Er = "allab";
  List? ListEr;
  String table = "attendance";
  bool loading = true;

  Future<List> getdata() async {
    var url = "http://103.141.241.97/test/atten.php";
    final response = await http.post(Uri.parse(url), body: {
      'sem': widget.sem,
      'branch': widget.branch,
      'type': widget.type,
    });
    if (kDebugMode) {
      print(response.body);
    }
    var jsonData = json.decode(response.body);
    setState(() {
      ListEr = jsonData;
      loading = false;
    });
    return json.decode(response.body);
  }

  final ser = [];

  void post() async {
    var url = "http://103.141.241.97/test/attendance.php";
    final response = await http.post(Uri.parse(url), body: {
      'student': stu_Er,
      // 'tb': table,
      'branch': widget.branch,
      'sem': widget.sem,
      'term': widget.term,
      'type': widget.type,
      'lecture': widget.lec,
      'takenby': widget.username,
      'cid': widget.sub,
    });
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }
    }
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Student List'),
        ),
        body: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: ListEr!.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        // checkColor: Colors.yellow,
                        title: Text(ListEr![index]["stu_id"]),
                        value: ser.contains(ListEr![index]["stu_id"]),
                        onChanged: (value) {
                          if (ser.contains(ListEr![index]["stu_id"])) {
                            ser.remove(ListEr![index]["stu_id"]);
                          } else {
                            ser.add(ListEr![index]["stu_id"]);
                          }
                          setState(() {
                            stu_Er = '$ser';
                            if (kDebugMode) {
                              print(stu_Er);
                            }
                          });
                        },
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: MaterialButton(
                        color: Colors.grey,
                        onPressed: () {
                          post();
                          print(widget.lec);
                          print(widget.branch);
                          print(widget.sem);
                          print(widget.username);
                          print(widget.term);
                          print(widget.sub);
                          print(widget.type);
                          print(stu_Er);
                          Navigator.of(context).pop();
                        },
                        child: const Text("Okay"),
                      ),
                    ),
                  ),
                ],
              ),
      );
}

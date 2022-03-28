// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Add_Marks_SP extends StatefulWidget {
  const Add_Marks_SP(
      {Key? key,
      required this.branch,
      required this.sem,
      required this.exam_id,
      required this.username,
      required this.cid})
      : super(key: key);

  final String branch;
  final String sem;
  final String exam_id;
  final String username;
  final String cid;

  @override
  State<Add_Marks_SP> createState() => _Add_Marks_SPState();
}

class _Add_Marks_SPState extends State<Add_Marks_SP> {
  TextEditingController markscontroller = TextEditingController();
  List? ListEr;
  String? stu_Er;
  bool loading = true;

  Future<List> fetchErno() async {
    var url = "http://103.141.241.97/test/stufetch.php";
    final response = await http.post(Uri.parse(url), body: {
      'sem': widget.sem,
      'branch': widget.branch,
      'cid': widget.cid,
      'exam_code': widget.exam_id,
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

  var ser = [];

  @override
  void initState() {
    fetchErno();
    // markscontroller.addListener(_printLatestValue);
    super.initState();
  }

  // @override
  // void dispose() {
  //   markscontroller.dispose();
  //   super.dispose();
  // }
  // void _printLatestValue (){
  //   print('Marks: ${markscontroller.text}');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add_Marks"),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: ListEr?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // checkColor: Colors.yellow,
                      title: Row(
                        children: [
                          Text(ListEr![index]["stu_id"]),
                          Expanded(
                            child: Container(),
                          ),
                          Expanded(
                            child: TextField(
                              // controller: markscontroller,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                // labelText: "Marks:",
                                hintText: "Enter Marks",
                              ),
                              onChanged: (value) {
                                if (ser.contains('$value')) {
                                  ser.remove('$value');
                                } else {
                                  ser.add('$value');
                                }
                                setState(() {
                                  stu_Er = '$ser';
                                  print(stu_Er);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: MaterialButton(
                          color: Colors.grey,
                          onPressed: () {
                            setState(() {
                              print(ser);
                              // ser = markscontroller.text as List;
                              // print(markscontroller);
                            });
                          },
                          child: const Text("ADD MARKS"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}

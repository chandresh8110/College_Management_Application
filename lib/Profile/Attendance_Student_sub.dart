// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../General Side/theme_helper.dart';

class Attendence_Student_subject_wise extends StatefulWidget {
  const Attendence_Student_subject_wise({Key? key, required this.username})
      : super(key: key);

  final String username;

  @override
  State<Attendence_Student_subject_wise> createState() =>
      _Attendence_Student_subject_wiseState();
}

class _Attendence_Student_subject_wiseState
    extends State<Attendence_Student_subject_wise> {
  bool loading = true;
  List? Attendence;

  Future getdata() async {
    var url = "http://103.141.241.97/test/count2.php";
    final response = await http.post(Uri.parse(url), body: {
      "id": widget.username,
    });
    var jsonData = json.decode(response.body);
    setState(() {
      Attendence = jsonData;
      loading = false;
    });
    if (kDebugMode) {
      print(Attendence);
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
        title: Text("All Sub. Atte. of " + widget.username),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: Attendence!.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                            child: ListTile(
                              title: Text("Sub. Name:- " +
                                  "${Attendence![i]["cname"]}"),
                              subtitle: Text("Attendance:- " +
                                  "${Attendence![i]["percentage"]}" +
                                  "%"),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}

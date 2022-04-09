import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../General Side/theme_helper.dart';

class Faculty_Marks_view_SP extends StatefulWidget {
  const Faculty_Marks_view_SP(
      {Key? key,
      required this.id,
      required this.exam_code,
      required this.sem,
      required this.branch})
      : super(key: key);
  final String id;
  final String exam_code;
  final String sem;
  final String branch;

  @override
  State<Faculty_Marks_view_SP> createState() => _Faculty_Marks_view_SPState();
}

class _Faculty_Marks_view_SPState extends State<Faculty_Marks_view_SP> {
  bool loading = true;
  List? Marks;

  Future getdata() async {
    var url = "http://103.141.241.97/test/viewmark.php";
    final response = await http.post(Uri.parse(url), body: {
      "id": widget.id,
      "branch": widget.branch,
      "sem": widget.sem,
      "exam_code": widget.exam_code,
    });
    var jsonData = json.decode(response.body);
    setState(() {
      Marks = jsonData;
      loading = false;
    });
    if (kDebugMode) {
      print(Marks);
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
        title: Text("All Sub. Marks of " + widget.id),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: Marks!.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                            child: ListTile(
                              title:
                                  Text("Subject id:- " + "${Marks![i]["cid"]}"),
                              subtitle:
                                  Text("Marks:- " + "${Marks![i]["mark"]}"),
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

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../General Side/theme_helper.dart';

class Faculty_Atten_View_SP extends StatefulWidget {
  const Faculty_Atten_View_SP(
      {Key? key,
      required this.id,
      required this.term,
      required this.sem,
      required this.branch})
      : super(key: key);
  final String id;
  final String term;
  final String sem;
  final String branch;

  @override
  State<Faculty_Atten_View_SP> createState() => _Faculty_Atten_View_SPState();
}

class _Faculty_Atten_View_SPState extends State<Faculty_Atten_View_SP> {
  bool loading = true;
  List? Attendence;

  Future getdata() async {
    var url = "http://103.141.241.97/test/fac_stucnamelist.php";
    final response = await http.post(Uri.parse(url), body: {
      "id": widget.id,
      "branch": widget.branch,
      "sem": widget.sem,
      "term": widget.term,
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
        title: Text("All Sub. Atte. of " + widget.id),
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
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: ThemeHelper().buttonBoxDecoration(context),
                            child: ListTile(
                              title: Text(
                                  "Sub. Name:- " + "${Attendence![i]["cname"]}"),
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

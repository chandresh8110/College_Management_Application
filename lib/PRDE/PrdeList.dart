import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../General Side/theme_helper.dart';

class PrdeList extends StatefulWidget {
  const PrdeList({Key? key, required this.branch, required this.sem})
      : super(key: key);

  final String branch;
  final String sem;

  @override
  _PrdeListState createState() => _PrdeListState();
}

class _PrdeListState extends State<PrdeList> {
  List? ListEr;
  String? stu_Er;
  Timer? timer;
  String? Action;
  bool loading = true;
  // String? Er;

  Future<List> fetchErno() async {
    var url = "http://103.141.241.97/test/stufetch.php";
    final response = await http.post(Uri.parse(url), body: {
      'sem': widget.sem,
      'branch': widget.branch,
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

  @override
  void initState() {
    fetchErno();
    timer =
        Timer.periodic(const Duration(seconds: 20), (Timer t) => fetchErno());
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  final ser = [];

  void post() async {
    var url = "http://103.141.241.97/test/prde.php";
    final response = await http.post(Uri.parse(url), body: {
      'ser': stu_Er,
      'tb': Action,
      // 'branch': widget.branch,
      'sem': widget.sem,
    });
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }
    }
  }

  // void post1() async {
  //   var url = "http://103.141.241.97/test/demot.php";
  //   final response = await http.post(
  //     Uri.parse(url),
  //     body: {
  //       'ser': stu_Er,
  //       // 'branch': widget.branch,
  //       // 'sem': widget.sem,
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     if (kDebugMode) {
  //       print(response.body);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Promotion/Demotion"),
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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            decoration: ThemeHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              onPressed: () {
                                Action = "promote";
                                post();
                                fetchErno();
                              },
                              child: const Text("Double tap to Promote"),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            onPressed: () {
                              Action = "demote";
                              post();
                              fetchErno();
                            },
                            child: const Text("Double tap to Demote"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      );
}

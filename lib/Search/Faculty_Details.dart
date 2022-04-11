// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:final_app/HOD_Side/HOD%20Dart/HOD_Faculty_Detail_Edit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../HOD_Side/HOD Dart/HOD_Edit_Details.dart';

class Faculty_Details extends StatefulWidget {
  const Faculty_Details({
    Key? key,
    required this.username,
    required this.id,
  }) : super(key: key);

  final String id;
  final String username;

  @override
  _Faculty_DetailsState createState() => _Faculty_DetailsState();
}

class _Faculty_DetailsState extends State<Faculty_Details> {
  Timer? timer;
  bool loading = true;
  String? table = "fac";
  List? list;

  Future deletedata() async {
    var url = "http://103.141.241.97/test/deletedata.php";
    var response = await http.post(Uri.parse(url), body: {
      "tb": table,
      "id": widget.id,
    });
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    }
  }

  Future getData() async {
    var url = "http://103.141.241.97/test/fac_profile.php";
    final response = await http.post(Uri.parse(url), body: {
      "username": widget.id,
    });
    var jsonData = json.decode(response.body);
    setState(() {
      list = jsonData;
      loading = false;
    });
    print(list);
  }

  @override
  void initState() {
    getData();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => getData());
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.id}"),
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
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: list!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text("id No. : " +
                                "${list![index]['id']}"),
                            dense: true,
                          ),
                          ListTile(
                            title: Text(
                              "Name : " +
                                  "${list![index]['fname']}" +
                                  "  ${list![index]['mname']}" +
                                  "  ${list![index]['lname']}",
                            ),
                            dense: true,
                          ),
                          ListTile(
                            title: Text("joining Year : " +
                                "${list![index]['jyear']}"),
                            dense: true,
                          ),
                          ListTile(
                            title:
                                Text("Branch : " + "${list![index]['branch']}"),
                            dense: true,
                          ),
                          ListTile(
                            title: Text("Faculty's Mo. no. : " +
                                "${list![index]['mno']}"),
                            dense: true,
                          ),
                          ListTile(
                            title: Text("Faculty's Email id : " +
                                "${list![index]['email']}"),
                            dense: true,
                          ),
                          ListTile(
                            title: Text(
                                "Address : " + "${list![index]['addr']}"),
                            dense: true,
                          ),
                          ListTile(
                            title: Text("Parent's Name : " +
                                "${list![index]['gname']}"),
                            dense: true,
                          ),
                          ListTile(
                            title: Text("Parent's Mo. no. : " +
                                "${list![index]['gmno']}"),
                            dense: true,
                          ),
                          ListTile(
                            title: Text("Parent's Email id : " +
                                "${list![index]['gemail']}"),
                            dense: true,
                          ),
                          ListTile(
                            title:
                            Text("Password : " + "${list![index]['pwd']}"),
                            dense: true,
                          ),
                          ListTile(
                            title:
                                Text("Status : " + "${list![index]['status']}"),
                            dense: true,
                          ),
                          ListTile(
                            title:
                            Text("Role : " + "${list![index]['role']}"),
                            dense: true,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 5),
                                child: Container(
                                  child: SizedBox(
                                    width: 100,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Edit_Faculty_details(
                                              index: index,
                                              list: list!,
                                              username: widget.username,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text('Edit'),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.green),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  child: SizedBox(
                                    width: 100,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Expanded(
                                              child: AlertDialog(
                                                // backgroundColor: Colors.red,
                                                title: Text('Alert!!!'),
                                                content: Text(
                                                  'Are you sure to delete data of ${list![index]['id']}',
                                                  style: TextStyle(
                                                    // color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    // textColor: Colors.white,
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('CANCEL'),
                                                  ),
                                                  TextButton(
                                                    // textColor: Colors.white,
                                                    onPressed: () {
                                                      deletedata();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Yes, Sure'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Text('Delete'),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.red),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

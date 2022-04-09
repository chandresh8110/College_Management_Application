// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';
import 'package:final_app/HOD_Side/HOD%20Dart/HOD_Faculty_Detail_Edit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../HOD_Side/HOD Dart/HOD_Edit_Details.dart';

class Faculty_Edit_Details extends StatefulWidget {
  const Faculty_Edit_Details(
      {Key? key,
      required this.list,
      required this.index,
      required this.username})
      : super(key: key);

  final List list;
  final int index;
  final String username;

  @override
  _Faculty_Edit_DetailsState createState() => _Faculty_Edit_DetailsState();
}

class _Faculty_Edit_DetailsState extends State<Faculty_Edit_Details> {

  String? table = "Faculty";

  Future deletedata() async {
    var url = "http://103.141.241.97/test/deletedata.php";
    var response = await http.post(Uri.parse(url), body: {
      "tb": table,
      "id": widget.list[widget.index]['id'],
    });
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['fname']}"),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                "Faculty Id: " + "${widget.list[widget.index]['id']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Name : " +
                    " ${widget.list[widget.index]['fname']}" +
                    "  ${widget.list[widget.index]['mname']}" +
                    "  ${widget.list[widget.index]['lname']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Joining Year : " + "${widget.list[widget.index]['jyear']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Branch : " + "${widget.list[widget.index]['branch']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Mobile No : " + "${widget.list[widget.index]['mno']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Email : " + "${widget.list[widget.index]['email']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Address : " + "${widget.list[widget.index]['addr']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Parent's Name : " +
                    "${widget.list[widget.index]['gname']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Parent's Mobile No : " +
                    "${widget.list[widget.index]['gmno']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Parent's Email : " +
                    "${widget.list[widget.index]['gemail']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Faculty's Status : " +
                    "${widget.list[widget.index]['status']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 5),
                  child: Container(
                    child: SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Edit_Faculty_details(
                                index: widget.index,
                                list: widget.list,
                                username: widget.username,
                              ),
                            ),
                          );
                        },
                        child: Text('Edit'),
                        style: ElevatedButton.styleFrom(primary: Colors.green),
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
                                      'Are you sure to delete data of ${widget.list[widget.index]['id']}',
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
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('CANCEL'),
                                      ),
                                      TextButton(
                                        // textColor: Colors.white,
                                        onPressed: () {
                                          deletedata();
                                         Navigator.of(context).pop();
                                        },
                                        child: Text('Yes, Sure'),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Text('Delete'),
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

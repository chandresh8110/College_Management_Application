// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:final_app/Faculty%20Side/Faculty_Dart/Edit_Student_details.dart';
import 'package:flutter/material.dart';

class Student_Details extends StatefulWidget {
  const Student_Details({Key? key, required this.list, required this.index})
      : super(key: key);

  final List list;
  final int index;

  @override
  _Student_DetailsState createState() => _Student_DetailsState();
}

class _Student_DetailsState extends State<Student_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['stu_fname']}"),
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
                "Enrollment No: " + "${widget.list[widget.index]['stu_id']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Name : " +
                    " ${widget.list[widget.index]['stu_fname']}" +
                    "  ${widget.list[widget.index]['stu_mname']}" +
                    "  ${widget.list[widget.index]['stu_lname']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Joining Year : " + "${widget.list[widget.index]['stu_jyear']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Sem : " + "${widget.list[widget.index]['sem']}",
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
                "Lab : " + "${widget.list[widget.index]['stu_lab']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Mobile No : " + "${widget.list[widget.index]['stu_mno']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Email : " + "${widget.list[widget.index]['stu_email']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Address : " + "${widget.list[widget.index]['stu_addr']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Parent's Name : " + "${widget.list[widget.index]['stu_gname']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Parent's Mobile No : " +
                    "${widget.list[widget.index]['stu_gmno']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Parent's Email : " +
                    "${widget.list[widget.index]['stu_gemail']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                "Student's Status : " + "${widget.list[widget.index]['status']}",
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
                              builder: (context) => Edit_Student_details(
                                index: widget.index,
                                list: widget.list,
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
                        onPressed: () {},
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

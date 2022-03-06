// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class HOD_Details extends StatefulWidget {
  const HOD_Details({Key? key, required this.list, required this.index})
      : super(key: key);

  final List list;
  final int index;

  @override
  _HOD_DetailsState createState() => _HOD_DetailsState();
}

class _HOD_DetailsState extends State<HOD_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text("${widget.list[widget.index]['fname']}"),
        // backgroundColor: Colors.blue,
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.cyanAccent,
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                "Id No: " + "${widget.list[widget.index]['id']}",
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
                "Role : " +
                    "${widget.list[widget.index]['role']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              dense: true,
            ),
            // ListTile(
            //   title: Text(
            //     "Student's Status : " + "${widget.list[widget.index]['status']}",
            //     style: TextStyle(
            //       fontSize: 20,
            //     ),
            //   ),
            //   dense: true,
            // ),
          ],
        ),
      ),
    );
  }
}

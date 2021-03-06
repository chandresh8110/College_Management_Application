// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:final_app/Profile/Reset_Password.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../General Side/theme_helper.dart';

class Details extends StatefulWidget {
  const Details({
    Key? key,
    required this.list,
    required this.index,
    required this.username,
  }) : super(key: key);

  final String username;
  final List list;
  final int index;

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text("${widget.list[widget.index]['stu_fname']}"),
        // backgroundColor: Colors.blue,
        gradient: LinearGradient(
          colors: [
            Colors.lightGreenAccent,
            Colors.lightBlueAccent,
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Enrollment No: " +
                        "${widget.list[widget.index]['stu_id']}",
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
                    "Joining Year : " +
                        "${widget.list[widget.index]['stu_jyear']}",
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
                    "Parent's Name : " +
                        "${widget.list[widget.index]['stu_gname']}",
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
                    "PWD : " +
                        "${widget.list[widget.index]['pwd']}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  dense: true,
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              decoration: ThemeHelper().buttonBoxDecoration(context),
              child: SizedBox(
                // width: double.infinity,
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Reset_Password(
                          username: widget.username,
                        ),
                      ),
                    );
                  },
                  child: Text("Reset Password"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

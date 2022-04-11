// ignore_for_file: camel_case_types

import 'package:final_app/Add_Data/Add_Student.dart';
import 'package:final_app/Material/HOD_View_Material.dart';
import 'package:final_app/Notice/HOD_Notice.dart';
import 'package:final_app/PRDE/Prde.dart';
import 'package:final_app/Search/Student_HOD_Search.dart';
import 'package:final_app/Search/Student_Search_List.dart';
import 'package:flutter/material.dart';

import '../../General Side/theme_helper.dart';
import '../../Search/Student_Faculty_Search.dart';

class New_Publish_Layout extends StatefulWidget {
  const New_Publish_Layout({Key? key, required this.username})
      : super(key: key);

  final String username;

  @override
  State<New_Publish_Layout> createState() => _New_Publish_LayoutState();
}

class _New_Publish_LayoutState extends State<New_Publish_Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Publish"),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  primary: false,
                  children: [
                    InkWell(
                      child: Container(
                        decoration: ThemeHelper().buttonBoxDecoration(context),
                        child: Column(
                          children: [
                            Center(
                              child: Image.network(
                                'https://cdn-icons-png.flaticon.com/512/4207/4207247.png',
                                height: 150,
                              ),
                            ),
                            Center(
                              child: Text(
                                "Material",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HOD_View_Material(
                              username: widget.username,
                            ),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      child: Container(
                        decoration: ThemeHelper().buttonBoxDecoration(context),
                        child: Column(
                          children: [
                            Image.network(
                              'https://cdn-icons-png.flaticon.com/512/3892/3892387.png',
                              height: 150,
                            ),
                            Text(
                              "Notice",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                HOD_Notice(username: widget.username),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

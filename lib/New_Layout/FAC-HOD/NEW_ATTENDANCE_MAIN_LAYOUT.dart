import 'package:final_app/Add_Data/Add_Faculty.dart';
import 'package:final_app/Attedance/Attedance_First_page.dart';
import 'package:final_app/Attedance/Faculty_Atten_View_FP.dart';
import 'package:flutter/material.dart';
import '../../General Side/theme_helper.dart';
import '../../Search/Faculty_HOD_Search.dart';
import '../../Search/Faculty_Search_List.dart';

class New_Attendance_Layout extends StatefulWidget {
  const New_Attendance_Layout({Key? key, required this.username})
      : super(key: key);

  final String username;

  @override
  State<New_Attendance_Layout> createState() => _New_Attendance_LayoutState();
}

class _New_Attendance_LayoutState extends State<New_Attendance_Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance"),
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
                                'https://cdn-icons-png.flaticon.com/512/6612/6612108.png',
                                height: 150,
                              ),
                            ),
                            Center(
                              child: Text(
                                "ADD Attendance",
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
                            builder: (context) => attendence(
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
                              'https://cdn-icons-png.flaticon.com/512/2/2123.png',
                              height: 150,
                            ),
                            Text(
                              "View Attendance",
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
                            builder: (context) => Faculty_Atten_View_FP(
                              username: widget.username,
                            ),
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

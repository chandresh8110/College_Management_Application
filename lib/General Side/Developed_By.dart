import 'package:final_app/Developer_Team/Developer_Team_Dart/Ashmine.dart';
import 'package:final_app/Developer_Team/Developer_Team_Dart/Brijesh.dart';
import 'package:final_app/Developer_Team/Developer_Team_Dart/Hardik.dart';
import 'package:final_app/General%20Side/theme_helper.dart';
import 'package:final_app/main.dart';
import 'package:final_app/slider/SliderDrawer.dart';
import 'package:flutter/material.dart';
import '../Developer_Team/Developer_Team_Dart/Chandresh.dart';
import 'GallaryPage.dart';
import '../slider/MenuWidget.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Student"),
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
          leading: MenuWidget(),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: GridView.count(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    primary: false,
                    children: [
                      InkWell(
                        child: Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: Column(
                            children: [
                              Center(
                                child: Image.asset(
                                  'images/Developer_Team/Chandresh.png',
                                  height: 300,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "CHANDRESH PATEL",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "(Front-End Developer)",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Chandresh(),
                            ),
                          );
                        },
                      ),
                      InkWell(
                        child: Container(
                          decoration:
                          ThemeHelper().buttonBoxDecoration(context),
                          child: Column(
                            children: [
                              Center(
                                child: Image.asset(
                                  'images/Developer_Team/Brijesh.png',
                                  height: 300,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "BRIJESH ASTIK",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "(Back-End Developer)",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Brijesh(),
                            ),
                          );
                        },
                      ),
                      InkWell(
                        child: Container(
                          decoration:
                          ThemeHelper().buttonBoxDecoration(context),
                          child: Column(
                            children: [
                              Center(
                                child: Image.asset(
                                  'images/Developer_Team/Hardik.png',
                                  height: 300,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "HARDIK BALAR",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "(Back-End Developer)",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Hardik(),
                            ),
                          );
                        },
                      ),
                      InkWell(
                        child: Container(
                          decoration:
                          ThemeHelper().buttonBoxDecoration(context),
                          child: Column(
                            children: [
                              Center(
                                child: Image.asset(
                                  'images/Developer_Team/Ashmin.png',
                                  height: 300,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "ASHMINE MANIK",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "(Front-End Developer)",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Ashmine(),
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
      ),
      onWillPop: () async {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SliderDrawer()));
        return false;
      },
    );
  }
}

EdgeInsets _edgeInsertsForIndex(int index) {
  if (index % 2 == 0) {
    return EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0, bottom: 0.0);
  } else {
    return EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0, bottom: 0.0);
  }
}

final List<String> networkNames = [
  'images/Developer_Team/chandresh_new.png',
  'images/Developer_Team/brijesh_new.png',
  'images/Developer_Team/hardik_new.png',
  'images/Developer_Team/ashmine_new.png',
];

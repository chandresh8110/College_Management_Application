// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../General Side/GallaryPage.dart';

class Teachers_Day extends StatefulWidget {
  const Teachers_Day({Key? key}) : super(key: key);

  @override
  State<Teachers_Day> createState() => _Teachers_DayState();
}

class _Teachers_DayState extends State<Teachers_Day> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blue,
            floating: true,
            //pinned: true,
            title: Text("Teacher's Day"),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.cyanAccent,
                      Colors.blue,
                    ]),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              //maxCrossAxisExtent: 100.0,
              mainAxisSpacing: 10,
              crossAxisSpacing: 0,
              //childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PhotoDetails(imagePath: networkNames[index]),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: _edgeInsertsForIndex(index),
                    child: SvgPicture.network(
                      networkNames[index % networkNames.length],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              childCount: networkNames.length,
            ),
          ),
        ],
      ),
    );
  }

  EdgeInsets _edgeInsertsForIndex(int index) {
    if (index % 2 == 0) {
      return EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0, bottom: 5.0);
    } else {
      return EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0, bottom: 5.0);
    }
  }

  final List<String> networkNames = [
    'http://103.141.241.97/Images/TD1.svg',
    'http://103.141.241.97/Images/TD2.svg',
    'http://103.141.241.97/Images/TD3.svg',
    'http://103.141.241.97/Images/TD4.svg',
    'http://103.141.241.97/Images/TD5.svg',
    'http://103.141.241.97/Images/TD6.svg',
    'http://103.141.241.97/Images/TD7.svg',
    'http://103.141.241.97/Images/TD8.svg',
    'http://103.141.241.97/Images/TD9.svg',
    'http://103.141.241.97/Images/TD10.svg',
    'http://103.141.241.97/Images/TD11.svg',
    'http://103.141.241.97/Images/TD12.svg',
    'http://103.141.241.97/Images/TD13.svg',
    'http://103.141.241.97/Images/TD14.svg',
  ];
}

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../General Side/GallaryPage.dart';

class Annual_Function extends StatefulWidget {
  const Annual_Function({Key? key}) : super(key: key);

  @override
  State<Annual_Function> createState() => _Annual_FunctionState();
}

class _Annual_FunctionState extends State<Annual_Function> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blue,
            floating: true,
            //pinned: true,
            title: Text("Annual Function"),
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
    'http://103.141.241.97/Images/Annual1.svg',
    'http://103.141.241.97/Images/Annual2.svg',
    'http://103.141.241.97/Images/Annual3.svg',
    'http://103.141.241.97/Images/Annual4.svg',
    'http://103.141.241.97/Images/Annual5.svg',
    'http://103.141.241.97/Images/Annual6.svg',
    'http://103.141.241.97/Images/Annual7.svg',
    'http://103.141.241.97/Images/Annual8.svg',
    'http://103.141.241.97/Images/Annual9.svg',
    'http://103.141.241.97/Images/Annual10.svg',
    'http://103.141.241.97/Images/Annual11.svg',
    'http://103.141.241.97/Images/Annual12.svg',
  ];
}

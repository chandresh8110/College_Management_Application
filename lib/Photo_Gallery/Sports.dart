import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../General Side/GallaryPage.dart';

class Sports extends StatefulWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  State<Sports> createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blue,
            floating: true,
            //pinned: true,
            title: Text("Sports"),
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
      return EdgeInsets.only(top: 0.0, left: 5.0, right: 5.0, bottom: 0.0);
    } else {
      return EdgeInsets.only(top: 0.0, left: 5.0, right: 5.0, bottom: 0.0);
    }
  }

  final List<String> networkNames = [
    'http://103.141.241.97/Images/Sport1.svg',
    'http://103.141.241.97/Images/Sport2.svg',
    'http://103.141.241.97/Images/Sport3.svg',
    'http://103.141.241.97/Images/Sport4.svg',
    'http://103.141.241.97/Images/Sport5.svg',
    'http://103.141.241.97/Images/Sport6.svg',
    'http://103.141.241.97/Images/Sport7.svg',
    'http://103.141.241.97/Images/Sport8.svg',
    'http://103.141.241.97/Images/Sport9.svg',
    'http://103.141.241.97/Images/Sport10.svg',
    'http://103.141.241.97/Images/Sport11.svg',
    'http://103.141.241.97/Images/Sport12.svg',
    'http://103.141.241.97/Images/Sport13.svg',
    'http://103.141.241.97/Images/Sport14.svg',
  ];
}

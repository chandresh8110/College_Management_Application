// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../General Side/GallaryPage.dart';

class Civil_photos extends StatefulWidget {
  const Civil_photos({Key? key}) : super(key: key);

  @override
  State<Civil_photos> createState() => _Civil_photosState();
}

class _Civil_photosState extends State<Civil_photos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blue,
            floating: true,
            //pinned: true,
            title: Text("Civil Photos"),
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
    'http://103.141.241.97/Images/Civil1.svg',
    'http://103.141.241.97/Images/Civil2.svg',
    'http://103.141.241.97/Images/Civil3.svg',
    'http://103.141.241.97/Images/Civil4.svg',
    'http://103.141.241.97/Images/Civil5.svg',
    'http://103.141.241.97/Images/Civil6.svg',
    'http://103.141.241.97/Images/Civil7.svg',
    'http://103.141.241.97/Images/Civil8.svg',
    'http://103.141.241.97/Images/Civil9.svg',
    'http://103.141.241.97/Images/Civil10.svg',
    'http://103.141.241.97/Images/Civil11.svg',
    'http://103.141.241.97/Images/Civil12.svg',
  ];
}
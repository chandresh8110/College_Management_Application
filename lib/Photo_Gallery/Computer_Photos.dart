// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../General Side/GallaryPage.dart';

class Computer_photos extends StatefulWidget {
  const Computer_photos({Key? key}) : super(key: key);

  @override
  State<Computer_photos> createState() => _Computer_photosState();
}

class _Computer_photosState extends State<Computer_photos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blue,
            floating: true,
            //pinned: true,
            title: Text("Computer/IT Photos"),
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
    'http://103.141.241.97/Images/Comp1.svg',
    'http://103.141.241.97/Images/Comp2.svg',
    'http://103.141.241.97/Images/Comp3.svg',
    'http://103.141.241.97/Images/Comp4.svg',
    'http://103.141.241.97/Images/Comp5.svg',
    'http://103.141.241.97/Images/Comp6.svg',
    'http://103.141.241.97/Images/Comp7.svg',
    'http://103.141.241.97/Images/Comp8.svg',
  ];
}
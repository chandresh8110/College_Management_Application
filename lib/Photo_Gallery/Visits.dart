import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../General Side/GallaryPage.dart';






class Visits extends StatefulWidget {
  const Visits({Key? key}) : super(key: key);

  @override
  State<Visits> createState() => _VisitsState();
}

class _VisitsState extends State<Visits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blue,
              floating: true,
              //pinned: true,
              title: Text('Visit'),
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
    'http://103.141.241.97/Images/Visit1.svg',
    'http://103.141.241.97/Images/Visit2.svg',
    'http://103.141.241.97/Images/Visit3.svg',
    'http://103.141.241.97/Images/Visit4.svg',
    'http://103.141.241.97/Images/Visit5.svg',
    'http://103.141.241.97/Images/Visit6.svg',
    'http://103.141.241.97/Images/Visit7.svg',
    'http://103.141.241.97/Images/Visit8.svg',
    'http://103.141.241.97/Images/Visit9.svg',
    'http://103.141.241.97/Images/Visit10.svg',
    'http://103.141.241.97/Images/Visit11.svg',
    'http://103.141.241.97/Images/Visit12.svg',
    'http://103.141.241.97/Images/Visit13.svg',
    'http://103.141.241.97/Images/Visit14.svg',
  ];
}


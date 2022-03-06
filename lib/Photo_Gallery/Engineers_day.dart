import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../General Side/GallaryPage.dart';

class Engineers_Day extends StatefulWidget {
  const Engineers_Day({Key? key}) : super(key: key);

  @override
  State<Engineers_Day> createState() => _Engineers_DayState();
}

class _Engineers_DayState extends State<Engineers_Day> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blue,
            floating: true,
            //pinned: true,
            title: Text("Engineer's Day"),
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
    '',
  ];
}

import 'package:final_app/main.dart';
import 'package:final_app/slider/SliderDrawer.dart';
import 'package:flutter/material.dart';
import 'GallaryPage.dart';
import '../slider/MenuWidget.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blue,
              floating: true,
              //pinned: true,
              title: Text('DeveloperPage'),
              leading: MenuWidget(),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                //maxCrossAxisExtent: 100.0,
                mainAxisSpacing: 0,
                crossAxisSpacing: 5,
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
                      child: Image.asset(
                        networkNames[index % networkNames.length],
                      ),
                    ),
                  );
                },
                childCount: networkNames.length,
              ),
            ),
          ],
        ),
      ),
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SliderDrawer()));
        return false;
      },
    );
  }
}

EdgeInsets _edgeInsertsForIndex(int index) {
  if (index % 2 == 0) {
    return EdgeInsets.only(top: 0.0, left: 5.0, right: 5.0, bottom: 0.0);
  } else {
    return EdgeInsets.only(top: 0.0, left: 5.0, right: 5.0, bottom: 0.0);
  }
}

final List<String> networkNames = [
  'images/Developer_Team/Chandresh.png',
  'images/Developer_Team/Brijesh.png',
  'images/Developer_Team/Hardik.png',
  'images/Developer_Team/Ashmin.png',
];

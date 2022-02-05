import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../GallaryPage.dart';




class Electrical extends StatelessWidget {
  const Electrical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blue,
              title: Text(
                  'ComputerBranch'
              ),
              floating: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 140,
                //color: Colors.yellow,
                padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
                //color: Colors.redAccent,
                child: Text('         Computer Engineering is a branch of engineering that integrates several fields of computer science and electronic engineering, required to develop computer hardware & software.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 40,
                //color: Colors.blue,
                padding: const EdgeInsets.only(left: 10, right: 10),
                //color: Colors.redAccent,
                child: Center(
                  child: Text('OUR VISION',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 130,
                //color: Colors.yellow,
                padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
                //color: Colors.redAccent,
                child: Text('         To study and innovate in the emerging era of computer science to engage broadly with the evolving needs of the society we live in by providing value-based education.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 40,
                //color: Colors.blue,
                padding: const EdgeInsets.only(left: 10, right: 10),
                //color: Colors.redAccent,
                child: Center(
                  child: Text('OUR MISSION',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 200,
                // color: Colors.yellow,
                padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
                //color: Colors.redAccent,
                child: Text('         The program’s key mission is to contribute to nation & society by advancing the fields of computer engineering through teaching & research advances, thus enhancing student awareness through immersive training, national & international participation, and experiential learning.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 40,
                //color: Colors.blue,
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                //color: Colors.redAccent,
                child: Center(
                  child: Text('Meet Our Faculties',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 0,
                //childAspectRatio: 0.99,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context,int index){
                  return RawMaterialButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => PhotoDetails(
                            imagePath: assetNames[index]
                        ),
                      ),
                      );
                    },

                    child: Container(
                      alignment: Alignment.center,
                      padding: _edgeInsertsForIndex(index),
                      child: SvgPicture.asset(
                        assetNames[index % assetNames.length],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },childCount: assetNames.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


EdgeInsets _edgeInsertsForIndex(int index) {
  if (index % 2 == 0) {
    return EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0, bottom: 0.0);
  } else
  {
    return EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0, bottom: 0.0);
  }
}

final List<String> assetNames =[
  'images/SVG/Annual1.svg',
  'images/SVG/Annual2.svg',
  'images/SVG/Annual3.svg',
];

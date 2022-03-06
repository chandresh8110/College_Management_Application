import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../General Side/GallaryPage.dart';




class Electrical extends StatelessWidget {
  const Electrical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              // backgroundColor: Colors.blue,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.cyanAccent,
                      Colors.blue,
                    ],
                  ),
                ),
              ),
              title: Text(
                  'Electrical Branch'
              ),
              floating: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                //color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text('         The branch of Electrical Engineering is very lively & electrifying as it provides exceptional career opportunities in all sectors of society. The electrical engineering improvements reform our contemporary world in all facets such as fitness, trade, learning & amusement.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      // color: Colors.red,
                      fontSize: 20,
                      //fontWeight: FontWeight.bold,
                      //decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Center(
                    child: Text('OUR VISION',
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
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
                  child: Text('         To become the centre of excellence in the Electrical Field for graduating engineers who serve as a valuable resource to the nation, and are instilled with human values & professional ethics.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
                //height: MediaQuery.of(context).size.height * 25/100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text('         To impart strong technical foundation through high quality teaching & practical skills, conforming to National & International Standards.'
                    '\n         To groom the graduating engineers for Industry, Research & Entrepreneurship.'
                    '\n         To inculcate ethical & moral values by providing an amiable environment.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
                  // return RawMaterialButton(
                  //   onPressed: (){
                  //     Navigator.push(context, MaterialPageRoute(
                  //       builder: (context) => PhotoDetails(
                  //           imagePath: assetNames[index]
                  //       ),
                  //     ),
                  //     );
                  //   },

                  return Container(
                    alignment: Alignment.center,
                    padding: _edgeInsertsForIndex(index),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        assetNames[index % assetNames.length],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                  //);
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

  'images/Faculty/EE/Aa.png',
  'images/Faculty/EE/Ab.png',
  'images/Faculty/EE/Ac.png',
  'images/Faculty/EE/Ad.png',
  'images/Faculty/EE/Ae.png',

];


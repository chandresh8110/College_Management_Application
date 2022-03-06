import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../General Side/GallaryPage.dart';




class Information_Technology extends StatelessWidget {
  const Information_Technology({Key? key}) : super(key: key);

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
                  'Information_Technology Branch'
              ),
              floating: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                //color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text('         Bachelor of Information Technology concentrates on the study of utilizing computers & telecommunications in order to control, gather, store & circulate information. Both hardware & software are parts of IT.'
                    '\n        More emphasis will be made on the students to instill skills to resolve challenging real-world problems. The department is also well equipped with the latest tools & technology to handle technological changes.',
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
                  child: Text('         To become an eminent department in the domain of Information Technology & to produce proficient IT engineers with dynamic technical skills to tackle the challenges with great enthusiasm & to be recognized for excellence, innovation & cognitive thinking.',
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
                  child: Text('         To inculcate skills of Information Technology in students & faculties to resolve challenging real-world problems.'
                    '\n         To encourage students to contribute to the overall development of society & become leaders in their profession.'
                    '\n         To provide students an intellectually stimulating environment for research, higher studies, and instill entrepreneurial attitude & values.'
                    '\n         To build an alliance with industries & other institutions to reinforce mutually beneficial correlation.'
                    '\n         To encourage students to get involved in extracurricular & co-curricular activities for physical, moral & social development.',
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
  'images/Faculty/IT/Aa.png',
  'images/Faculty/IT/Ab.png',
  'images/Faculty/IT/Ac.png',
  'images/Faculty/IT/Ad.png',
];


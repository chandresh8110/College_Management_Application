import 'package:flutter/material.dart';




class Dmechanical extends StatelessWidget {
  const Dmechanical({Key? key}) : super(key: key);

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
                  'Mechanical Branch'
              ),
              floating: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                //color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text('         Department has an excellent Placement Record with the students getting placed in core industries as well as IT sectors. Our students have won awards at various technical events, conferences & symposiums held at prestigious institutions. The Department has a dedicated & an experienced faculty team driving the department towards excellence in academics as well as in R&D activities.',
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
                  child: Text('         To deliver total quality education in mechanical engineering through proper channels & research in cutting edge technologies & human values. This helps in forming a culture having trust & continuous learning to meet expectations of students, industries & society at large.',
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
                  child: Text('         To impart highest quality education to the students to build their capacity & enhance their skills to make them globally competitive mechanical engineers.'
                      '\n       To provide the students with an academic environment of excellence, leadership, ethical guidelines & lifelong learning needed for a long productive career.'
                      '\n       To engage the students in academic as well as scholarly activities, which strengthen the department reputation in the global market.',
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
  'images/Faculty/Mech/Aa.png',
  'images/Faculty/Mech/Ab.png',
  'images/Faculty/Mech/Ac.png',
  'images/Faculty/Mech/Ad.png',
  'images/Faculty/Mech/Ae.png',
  'images/Faculty/Mech/Af.png',
];


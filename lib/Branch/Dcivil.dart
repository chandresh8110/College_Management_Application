import 'package:flutter/material.dart';




class Dcivil extends StatelessWidget {
  const Dcivil({Key? key}) : super(key: key);

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
                  'Civil Branch'
              ),
              floating: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                //color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text("         Our department is equipped with State-of-the-Art Laboratories such as basics of Civil Engineering, Mechanics of Solids, Surveying, Concrete Technology, Soil Mechanics, Highway Engineering, Fluid Mechanics, Environmental Engineering, Water Resources Engineering, Geology Model Lab, Building & Town Planning Lab & Computer Lab.",
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
                  child: Text('         To be an outstanding department for enhancing sustainability in development of society.',
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
                  child: Text('         To provide the best possible educational facilities for training bright students for careers in the field of civil engineering.'
                      '\n         To deal with the contemporary issues and to cater to the societal needs.',
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
  'images/Faculty/Civil/Aa.png',
  'images/Faculty/Civil/Ab.png',
  'images/Faculty/Civil/Ac.png',
  'images/Faculty/Civil/Ad.png',
  'images/Faculty/Civil/Ae.png',

];

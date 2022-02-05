import 'package:flutter/material.dart';




class Dcomputer extends StatelessWidget {
  const Dcomputer({Key? key}) : super(key: key);

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
                height: 200,
                //color: Colors.yellow,
                padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
                child: Text('         The Department of Computer Engineering was established in the year 2019 with the prime objective to impart education with theory as well as practical knowledge. Department is providing an outstanding academic environment by NET/GATE qualified Professors.',
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
                height: 80,
                //color: Colors.yellow,
                padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
                //color: Colors.redAccent,
                child: Text('         To educate technically skilled and ethically sound Diploma Engineers to service our society.',
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
                padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
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
                height: 110,
                //color: Colors.yellow,
                padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
                //color: Colors.redAccent,
                child: Text('         To adopt collaborative initiatives with academia & industries. To offer a robust theoretical basis complemented with giant sensible education.',
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
                    child: Image.asset(
                      assetNames[index % assetNames.length],
                      fit: BoxFit.cover,
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
  'images/Faculty/CE/Aa.png',
  'images/Faculty/CE/Ab.png',
  'images/Faculty/CE/Ac.png',
];

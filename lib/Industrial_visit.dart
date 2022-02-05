import 'package:flutter/material.dart';
import 'GallaryPage.dart';




class IndustrialVisit extends StatelessWidget {
  const IndustrialVisit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          slivers: [
            // SliverAppBar(
            //   backgroundColor: Colors.blue,
            //   floating: true,
            //   //pinned: true,
            //   title: Text('Industrial_Visit_Page'),
            // ),
            SliverToBoxAdapter(
              child: Container(
                //color: Colors.amber,
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child:  Container(
                //color:Colors.greenAccent,
                height: 430,
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text('       Apollo Institute of Engineering and Technology provides industrial Exposure to every students in each year to explore technical fields and understand basic industrial practical knowledge.'
                    '\n\n\n ⭐ Industries have been Visited : -'
                    '\n\n📍 CDAC, Pune'
                    '\n📍 Adani Port'
                    '\n📍 Science City'
                    '\n📍 Mundra Port'
                    '\n📍 Sardar Sarovar'
                    '\n📍 Harsha Engineering'
                    '\n📍 Hindustan Coca-Cola Beverages Ltd.'
                    '\n📍 Mahatma Mandir',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: 0.99,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context,int index){
                  return RawMaterialButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => PhotoDetails(
                            imagePath: networkNames[index]
                        ),
                      ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: _edgeInsertsForIndex(index),
                      child: Image.network(
                        networkNames[index % networkNames.length],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },childCount: networkNames.length,
              ),
            ),
          ]
      ),
    );
  }
}


EdgeInsets _edgeInsertsForIndex(int index) {
  if (index % 2 == 0) {
    return EdgeInsets.only(top: 0.0, left: 5.0, right: 5.0, bottom: 0.0);
  } else
  {
    return EdgeInsets.only(top: 0.0, left: 5.0, right: 5.0, bottom: 0.0);
  }
}

final List<String> networkNames =[
  'https://drive.google.com/uc?export=view&id=1pJmZPI5DWXMtfCkBzWaATq7MVJ_4MuMy',
  'https://drive.google.com/uc?export=view&id=1pJmZPI5DWXMtfCkBzWaATq7MVJ_4MuMy',
  'https://drive.google.com/uc?export=view&id=1pJmZPI5DWXMtfCkBzWaATq7MVJ_4MuMy',

];
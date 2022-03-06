import 'package:final_app/Branch/Dcomputer.dart';
import 'package:final_app/Branch/Dmechanical.dart';
import 'package:flutter/material.dart';
import 'Dcivil.dart';


class DE extends StatelessWidget {
  const DE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              // height: 110,
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              //color: Colors.yellow,
              child: Text('      Here in AIET, We have 3 main branch in Diploma Engineering.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(
                        builder:(context)=> Dcomputer()
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 250,
                    width: 250,
                    //color: Colors.greenAccent,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/Branch/CE.png'),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(
                        builder:(context)=> Dcivil()
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 250,
                    width: 250,
                    //color: Colors.greenAccent,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/Branch/CIE.png'),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(
                        builder:(context)=> Dmechanical()
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 250,
                    width: 250,
                    //color: Colors.greenAccent,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/Branch/ME.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

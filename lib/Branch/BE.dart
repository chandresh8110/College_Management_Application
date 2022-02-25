import 'package:final_app/Branch/AI_DS.dart';
import 'package:final_app/Branch/Civil.dart';
import 'package:final_app/Branch/Electrical.dart';
import 'package:final_app/Branch/Information_Technology.dart';
import 'package:final_app/Branch/Mechanical.dart';
import 'package:flutter/material.dart';
import 'Computer.dart';


class BE extends StatelessWidget {
  const BE({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 110,
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              //color: Colors.yellow,
              child: Text('      Here in AIET, We have 6 main branch in Bachelor of Engineering.',
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
                         builder:(context)=> Computer()
                     ),
                 );
               },
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
             InkWell(
               onTap: (){
                 Navigator.push(context,
                   MaterialPageRoute(
                       builder:(context)=> Information_Technology()
                   ),
                 );
               },
               child: Container(
                 height: 250,
                 width: 250,
                 //color: Colors.greenAccent,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage('images/Branch/IT.png'),
                   ),
                 ),
               ),
             ),
             InkWell(
               onTap: (){
                 Navigator.push(context,
                   MaterialPageRoute(
                       builder:(context)=> Civil()
                   ),
                 );
               },
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
             InkWell(
               onTap: (){
                 Navigator.push(context,
                   MaterialPageRoute(
                       builder:(context)=> Mechanical()
                   ),
                 );
               },
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
             InkWell(
               onTap: (){
                 Navigator.push(context,
                   MaterialPageRoute(
                       builder:(context)=> Electrical()
                   ),
                 );
               },
               child: Container(
                 height: 250,
                 width: 250,
                 //color: Colors.greenAccent,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage('images/Branch/EE.png'),
                   ),
                 ),
               ),
             ),
             InkWell(
               onTap: (){
                 Navigator.push(context,
                   MaterialPageRoute(
                       builder:(context)=> AI_DS()
                   ),
                 );
               },
               child: Container(
                 height: 250,
                 width: 250,
                 //color: Colors.greenAccent,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage('images/Branch/AI_DS.png'),
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

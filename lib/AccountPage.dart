import 'package:flutter/material.dart';

import 'Student Side/Student Dart/StudentHomePage.dart';
import 'slider/MenuWidget.dart';




class AccountPage extends StatelessWidget {
  //get onPressed => DevelopedBy();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Login Page'),
        leading: MenuWidget(),
      ),
        //backgroundColor: Colors.black,
        body:SafeArea(
         child: Column(
          // mainAxisSize: MainAxisSize.min,
          //verticalDirection: VerticalDirection.down,
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
          CircleAvatar(
            radius: 80.0,
           backgroundImage: NetworkImage('https://image3.mouthshut.com/images/imagesp/925888452s.jpg'),
          ),
          SizedBox(
              height: 10.0
          ),
          Center(
            child: Text(
              'Hello User!',
              style: TextStyle(
                 // fontFamily: 'DancingScript',
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                 // color: Colors.white
              ),
            ),
          ),
          SizedBox(
              height: 10.0
          ),
                Center(
                  child: Text(
              'Welcome to AIET',
              style: TextStyle(
                  fontFamily:'Caveat',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w200,
                 // color: Colors.white70
              ),
            ),
          ),
              SizedBox(
               height: 20.0,
             ),
          Expanded(
          child: ListView(
                 children:<Widget>[
                Card(
                  //color: Colors.grey[900],
                   margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0 ),
                 child: ListTile(
                   leading: Icon(
                      Icons.account_circle_outlined,
                      size: 20.0,
                     // color: Colors.grey[500],
                       ),
                   /*title: Text(
                     'UserName',
                     style: TextStyle(
                       color: Colors.grey[500],
                      // fontFamily: 'Rubik',
                       fontSize: 20.0,
                       fontWeight: FontWeight.w600,
                     ),
                   ),*/
                   title: TextField(
                     decoration: InputDecoration(
                       labelText: 'UserName',
                       labelStyle: TextStyle(
                         fontSize: 20.0,
                        // color: Colors.grey[500]
                       ),
                       border: OutlineInputBorder(),
                     ),
                   ),
                 ),
            ),
                  Card(
                   // color: Colors.grey[900],
                    margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0 ),
                    child: ListTile(
                    leading: Icon(
                      Icons.vpn_key_sharp,
                      size: 20.0,
                     // color: Colors.grey[500],
                       ),
                        /*title: Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.grey[500],
                       // fontFamily: 'Rubik',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),*/
                      title: TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontSize: 20.0,
                              //color: Colors.grey[500]
                          ),
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
              ),
            ),
                    Card(
                      color: Colors.blue[600],
                       margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0 ),
                     child: ListTile(
                       title: Center(
                      child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                     // fontFamily: 'Rubik',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
                  SizedBox(
                  height: 70.0,
              ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    child: Card(
                    color: Colors.grey[900],
                    margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0 ),
                     child: ListTile(
                     leading: Icon(
                      Icons.info_outline_rounded,
                      size: 20.0,
                      color: Colors.grey[500],
                      ),
                     title: Text(
                      'Developer Team',
                      style: TextStyle(
                        color: Colors.grey[500],
                        // fontFamily: 'Rubik',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> SHomePage()),
                  );
                },
              ),
              ]
              ),
              ),
        ],
      ),
    ),
    );
  }
}

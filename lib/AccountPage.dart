import 'dart:convert';

import 'package:final_app/Student%20Side/Student_Slider/SSliderDrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Faculty Side/Faculty Slider/FSliderDrawer.dart';
import 'HOD_Side/HOD_Slider/HSliderDrawer.dart';
import 'slider/MenuWidget.dart';




class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  String dropdownValue = 'Student';
  String? table;

  Future login() async{
    var url= "http://192.168.2.25/test/test.php";
    var response = await http.post(Uri.parse(url),body:{
      "table" : dropdownValue,
      "username" : usernamecontroller.text,
      "password" : passwordcontroller.text,
    });

    var data = json.decode(response.body);
    if (data == "Student") {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SSliderDrawer(),),);
    } else if(data == "Faculty") {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FSliderDrawer(),),);
    } else if(data == "HOD"){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HSliderDrawer(),),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blue,
              title: Text('LoginPage'),
              leading: MenuWidget(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage('https://image3.mouthshut.com/images/imagesp/925888452s.jpg'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 10,right: 20,left: 60,bottom: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blueGrey,width: 2),
                  ),
                  child:DropdownButton<String>(
                    value: dropdownValue,
                    hint: Text("Select Role"),
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    elevation: 20,
                    isExpanded: true,
                    // style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 0,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Student', 'Faculty', 'HOD']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 0,right: 10, left: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextField(
                    // obscureText: true,
                    controller: usernamecontroller,
                    decoration: const InputDecoration(
                      border: const OutlineInputBorder(),
                      icon: Icon(Icons.account_circle_outlined),
                      labelText: 'Enrollment No./ Faculty No.',
                      hintText: 'Enrollment No./ Faculty No.',
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 0,right: 10,left: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordcontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.vpn_key_outlined),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10,right: 20,left: 20),
                child: Container(
                  color: Colors.blue,
                  child: MaterialButton(
                      child: const Text('Login'),
                      onPressed: (){
                        login();
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}








// class AccountPage extends StatefulWidget {
//   const AccountPage({Key? key}) : super(key: key);
//
//   @override
//   State<AccountPage> createState() => _AccountPageState();
// }
//
// class _AccountPageState extends State<AccountPage> {
//
//   late String username, password;
//   late bool error, sending, success;
//   late String msg;
//   String alert = "Ready for login";
//   String dropdownValue = 'student';
//   String? table;
//
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//
//   String url = "http://192.168.2.25/test/login.php";
//
//   @override
//   void initState() {
//     error = false;
//     sending = false;
//     success = false;
//     msg = "";
//     super.initState();
//   }
//
//   Future<void> loginProcess() async{
//
//     var res = await http.post(Uri.parse(url),body: {
//       "table" : dropdownValue,
//       "username" : usernameController.text,
//       "password" : usernameController.text,
//     });
//     var data = json.decode(res.body);//decoding json to array
//
//     if (res.statusCode == 200) {
//       print(res.body); //print raw response on console
//       if(data["error"]){
//         setState(() { //refresh the UI when error is recieved from server
//           sending = false;
//           error = true;
//           msg = data["message"]; //error message from server
//         });
//       }else{
//
//         usernameController.text = "";
//         passwordController.text = "";
//         //after write success, make fields empty
//
//         setState(() {
//           sending = false;
//           success = true; //mark success and refresh UI with setState
//         });
//       }
//
//     }else{
//       //there is error
//       setState(() {
//         error = true;
//         msg = "Error during sendign data.";
//         sending = false;
//         //mark error and refresh UI with setState
//       });
//     }
//
//   //   if(data.length < 1){
//   //
//   //     setState(() {
//   //       alert = "You can't login";
//   //     });
//   //   }else{
//   //     setState(() {
//   //       username = data[0]["username"];
//   //       password = data[0]["password"];
//   //       //tb = dataUser[0]["tb"];
//   //     });
//   //
//   //     if(table == "student"){
//   //       Navigator.pushReplacement(context,
//   //           MaterialPageRoute(builder: (context) => SSliderDrawer())
//   //       );
//   //     }else if(table == "faculty"){
//   //       Navigator.pushReplacement(context,
//   //           MaterialPageRoute(builder: (context) => FSliderDrawer())
//   //       );
//   //     }else if(table == "hod"){
//   //       Navigator.pushReplacement(context,
//   //           MaterialPageRoute(builder: (context) => HSliderDrawer())
//   //       );
//   //     }else{
//   //       Text('invalid Selection');
//   //     }
//   //   }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               backgroundColor: Colors.blue,
//               title: Text(
//                 'LoginPage'
//               ),
//               floating: true,
//               leading: MenuWidget(),
//             ),
//             SliverToBoxAdapter(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 50),
//                   child: CircleAvatar(
//                     radius: 80.0,
//                     backgroundImage: NetworkImage('https://image3.mouthshut.com/images/imagesp/925888452s.jpg'),
//                   ),
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 20,bottom: 10),
//                 child: Container(
//                   child: Center(
//                     child: Text(
//                       'Welcome to AIET',
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: Container(
//                 child: DropdownButton<String>(
//                   //isExpanded: true,
//                   value: dropdownValue,
//                   icon: const Icon(Icons.arrow_downward),
//                   elevation: 16,
//                   style: const TextStyle(color: Colors.deepPurple),
//                   underline: Container(
//                     height: 0.1,
//                     color: Colors.deepPurpleAccent,
//                   ),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       dropdownValue = newValue!;
//                     });
//                   },
//                   items: <String>['student', 'faculty', 'hod']
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 10,left: 10, top: 10),
//                 child: Card(
//                   child: (
//                   ListTile(
//                     leading: Icon(Icons.account_circle_outlined),
//                     title: TextField(
//                       controller: usernameController,
//                       decoration: InputDecoration(
//                       labelText: 'UserName',
//                       labelStyle: TextStyle(
//                       fontSize: 20.0,
//                       // color: Colors.grey[500]
//                      ),
//                         border: OutlineInputBorder(),
//                         ),
//                       ),
//                     )
//                   ),
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 10,left: 10, top: 10),
//                 child: Card(
//                   child: (
//                       ListTile(
//                         leading: Icon(Icons.vpn_key_outlined),
//                         title: TextField(
//                           controller: passwordController,
//                           decoration: InputDecoration(
//                             labelText: 'Password',
//                             labelStyle: TextStyle(
//                               fontSize: 20.0,
//                               // color: Colors.grey[500]
//                             ),
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       )
//                   ),
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
//                 child: MaterialButton(
//                   height: 50,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Text('Login',
//                   style: TextStyle(
//                     fontSize: 20,
//                     ),
//                   ),
//                   color: Colors.blue,
//                     onPressed:(){
//                       loginProcess();
//                     },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
// // class AccountPage extends StatelessWidget {
// //   const AccountPage({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.blue,
// //         title: const Text('Login Page'),
// //         leading: MenuWidget(),
// //       ),
// //         //backgroundColor: Colors.black,
// //         body:SafeArea(
// //          child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             SizedBox(
// //               height: 20.0,
// //             ),
// //           CircleAvatar(
// //             radius: 80.0,
// //            backgroundImage: NetworkImage('https://image3.mouthshut.com/images/imagesp/925888452s.jpg'),
// //           ),
// //           SizedBox(
// //               height: 10.0
// //           ),
// //           Center(
// //             child: Text(
// //               'Hello User!',
// //               style: TextStyle(
// //                  // fontFamily: 'DancingScript',
// //                   fontSize: 40.0,
// //                   fontWeight: FontWeight.bold,
// //                  // color: Colors.white
// //               ),
// //             ),
// //           ),
// //           SizedBox(
// //               height: 10.0
// //           ),
// //                 Center(
// //                   child: Text(
// //                     'Welcome to AIET',
// //                     style: TextStyle(
// //                         fontFamily:'Caveat',
// //                         fontSize: 20.0,
// //                         fontWeight: FontWeight.w200,
// //                        // color: Colors.white70
// //                     ),
// //                   ),
// //                 ),
// //               SizedBox(
// //                height: 20.0,
// //              ),
// //           Expanded(
// //             child: ListView(
// //                  children:<Widget>[
// //                 Card(
// //                   //color: Colors.grey[900],
// //                    margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0 ),
// //                  child: ListTile(
// //                    leading: Icon(
// //                       Icons.account_circle_outlined,
// //                       size: 20.0,
// //                      // color: Colors.grey[500],
// //                        ),
// //                    title: TextField(
// //                      decoration: InputDecoration(
// //                        labelText: 'UserName',
// //                        labelStyle: TextStyle(
// //                          fontSize: 20.0,
// //                         // color: Colors.grey[500]
// //                        ),
// //                        border: OutlineInputBorder(),
// //                      ),
// //                    ),
// //                  ),
// //                 ),
// //                   Card(
// //                    // color: Colors.grey[900],
// //                     margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0 ),
// //                     child: ListTile(
// //                     leading: Icon(
// //                       Icons.vpn_key_sharp,
// //                       size: 20.0,
// //                      // color: Colors.grey[500],
// //                        ),
// //                       title: TextField(
// //                         decoration: InputDecoration(
// //                           labelText: 'Password',
// //                           labelStyle: TextStyle(
// //                               fontSize: 20.0,
// //                               //color: Colors.grey[500]
// //                           ),
// //                           border: OutlineInputBorder(),
// //                         ),
// //                         obscureText: true,
// //                       ),
// //                     ),
// //                   ),
// //                     Card(
// //                       color: Colors.blue[600],
// //                        margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0 ),
// //                            child: ListTile(
// //                              title: Center(
// //                                 child: Text(
// //                               'Login',
// //                               style: TextStyle(
// //                                 color: Colors.white,
// //                                // fontFamily: 'Rubik',
// //                                 fontSize: 20.0,
// //                                 fontWeight: FontWeight.w600,
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                     ),
// //                   ]
// //                 ),
// //               ),
// //             ],
// //           ),
// //       ),
// //     );
// //   }
// // }
//

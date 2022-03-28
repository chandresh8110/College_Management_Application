// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:final_app/Student%20Side/Student_Slider/SMenuItem.dart';
import 'package:flutter/material.dart';

class SMenuItems {
  static const HomePage = SMenuItem('Home', Icons.home);
  static const Notice_View_Student =
      SMenuItem('Notice', Icons.mark_email_unread_outlined);
  static const Student_Material_View =
      SMenuItem('Material', Icons.sticky_note_2_outlined);
  // static const BranchPage = SMenuItem('Branch', Icons.celebration);
  // static const FacilitiesPage = SMenuItem('Facilities', Icons.view_comfortable);
  // static const ContactUsPage = SMenuItem('Contact_Us', Icons.phone);
  // static const DeveloperPage =
  //     SMenuItem('App_Developer', Icons.developer_board_outlined);
  static const Profile_page = SMenuItem('Setting', Icons.settings);

  static const all = <SMenuItem>[
    HomePage,
    Notice_View_Student,
    Student_Material_View,
    // BranchPage,
    // FacilitiesPage,
    // ContactUsPage,
    // DeveloperPage,
    Profile_page,
  ];
}

class SMenuPage extends StatelessWidget {
  const SMenuPage(
      {Key? key,
      required this.currentItem,
      required this.onSelectedItem,
      required this.username})
      : super(key: key);

  final SMenuItem currentItem;
  final ValueChanged<SMenuItem> onSelectedItem;
  final String username;

  Future Getimage() async {
    var url = "http://103.141.241.97/test/app_profile.php";
    var response = await http.post(Uri.parse(url),body: {
      "username" : username,
    });
    return json.decode(response.body);
  }


  @override
  Widget build(BuildContext context) => Scaffold(
        //backgroundColor: Colors.grey[400],
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  // Colors.yellow,
                  Colors.cyan,
                  Colors.lime,
                  // Colors.indigo,
                  // Colors.purpleAccent,
                  // Colors.deepOrange,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   height: 115,
                //   child: FutureBuilder(
                //     future: Getimage(),
                //     builder: (context, snapshot) {
                //       if (snapshot.hasError) print(snapshot.error);
                //       return snapshot.hasData
                //           ? ListView.builder(
                //               // itemCount: snapshot.data,
                //               itemBuilder: (context, index) {
                //                 List? list = snapshot.data as List?;
                //                 return Padding(
                //                   padding: const EdgeInsets.only(right: 250),
                //                   child: Padding(
                //                     padding: const EdgeInsets.only(top: 10),
                //                     child: ListTile(
                //                       title: Center(
                //                         child: CircleAvatar(
                //                           radius: 50.0,
                //                           backgroundImage: NetworkImage(
                //                             "http://103.141.241.97/test/uploads/student/${list![index]['stu_pic']}",
                //                           ),
                //                           backgroundColor: Colors.transparent,
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 );
                //               },
                //             )
                //           : CircularProgressIndicator();
                //     },
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage:
                        NetworkImage('http://103.141.241.97/images/Logo_.png'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10),
                  child: Text(
                    'Hello ' + username + ' !',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                // // Spacer(),
                Padding(padding: EdgeInsets.only(top: 50)),
                ...SMenuItems.all.map(buildMenuItem).toList(),
                Spacer(flex: 2),
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItem(SMenuItem item) => ListTileTheme(
        //selectedColor: Colors.white,
        child: ListTile(
          selectedColor: Colors.purple,
          iconColor: Colors.black,
          selected: currentItem == item,
          minLeadingWidth: 20,
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () => onSelectedItem(item),
        ),
      );
}

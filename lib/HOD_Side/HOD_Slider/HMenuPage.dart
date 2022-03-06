import 'package:final_app/Profile/HOD_Details_Page.dart';
import 'package:final_app/Profile/HOD_Setting_Page.dart';
import 'package:final_app/Search/Student_HOD_Search.dart';
import 'package:flutter/material.dart';
import 'HMenuItem.dart';

class HMenuItems {
  static const HomePage = HMenuItem('Home', Icons.home);
  static const HOD_Add_Members =
      HMenuItem('Add_Members', Icons.person_add_outlined);
  static const HOD_Add_Things =
      HMenuItem('Add_Things', Icons.add_circle_outline_rounded);
  static const Notice = HMenuItem('Notice', Icons.mark_email_unread_outlined);
  static const Material = HMenuItem('Material', Icons.sticky_note_2_outlined);
  // static const Student_HOD_Search =
  //     HMenuItem('Student Search', Icons.person_search_outlined);
  static const HOD_Edit_Details = HMenuItem('Search Members', Icons.person_search_outlined);
  static const HOD_Setting_page = HMenuItem('Setting', Icons.settings);

  // static const ContactUsPage = HMenuItem('Contact_Us', Icons.phone);
  // static const DeveloperPage =
  //     HMenuItem('App_Developer', Icons.developer_board_outlined);

  static const all = <HMenuItem>[
    HomePage,
    HOD_Add_Members,
    HOD_Add_Things,
    Notice,
    Material,
    HOD_Edit_Details,
    HOD_Setting_page,
    // FacilitiesPage,
    // ContactUsPage,
    // DeveloperPage,
  ];
}

class HMenuPage extends StatelessWidget {
  const HMenuPage(
      {Key? key,
      required this.currentItem,
      required this.onSelectedItem,
      required this.username})
      : super(key: key);
  final HMenuItem currentItem;
  final ValueChanged<HMenuItem> onSelectedItem;
  final String username;

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
                //Spacer(),
                Padding(padding: EdgeInsets.only(top: 50)),
                ...HMenuItems.all.map(buildMenuItem).toList(),
                Spacer(flex: 2),
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItem(HMenuItem item) => ListTileTheme(
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

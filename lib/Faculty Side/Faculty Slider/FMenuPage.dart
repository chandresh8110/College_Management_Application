import 'package:flutter/material.dart';
import 'FMenuItem.dart';

class FMenuItems {
  static const HomePage = FMenuItem('Home', Icons.home);
  static const Add = FMenuItem('Add', Icons.person_add_outlined);
  static const Notice = FMenuItem('Notice', Icons.mark_email_unread_outlined);
  static const Material = FMenuItem('Material', Icons.sticky_note_2_outlined);
  static const Student_Faculty_Search =
      FMenuItem('Search_Student', Icons.person_search_outlined);
  static const Faculty_Setting_page = FMenuItem('Setting', Icons.settings);
  // static const ContactUsPage = FMenuItem('Contact_Us', Icons.phone);
  // static const DeveloperPage =
  //     FMenuItem('App_Developer', Icons.developer_board_outlined);

  static const all = <FMenuItem>[
    HomePage,
    Add,
    Notice,
    Material,
    Student_Faculty_Search,
    Faculty_Setting_page,
    // ContactUsPage,
    // DeveloperPage,
  ];
}

class FMenuPage extends StatelessWidget {
  const FMenuPage(
      {Key? key,
      required this.currentItem,
      required this.onSelectedItem,
      required this.username})
      : super(key: key);
  final FMenuItem currentItem;
  final ValueChanged<FMenuItem> onSelectedItem;
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
                      fontSize: 30,
                    ),
                  ),
                ),
                //Spacer(),
                Padding(padding: EdgeInsets.only(top: 50)),
                ...FMenuItems.all.map(buildMenuItem).toList(),
                Spacer(flex: 2),
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItem(FMenuItem item) => ListTileTheme(
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

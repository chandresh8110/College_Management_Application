import 'package:flutter/material.dart';
import 'MenuItem.dart';

class MenuItems {
  static const HomePage = MenuItem('Home', Icons.home);
  static const BranchPage = MenuItem('Branch', Icons.celebration);
  static const FacilitiesPage = MenuItem('Facilities', Icons.view_comfortable);
  static const ContactUsPage = MenuItem('Contact_Us', Icons.phone);
  static const DeveloperPage =
      MenuItem('App_Developer', Icons.developer_board_outlined);
  static const Faculty_Search_List =
      MenuItem('Faculty List', Icons.developer_board_outlined);
  static const Student_Search_List =
      MenuItem('Student List', Icons.developer_board_outlined);
  static const Course_Search_List =
      MenuItem('Course List', Icons.developer_board_outlined);

  static const Prde = MenuItem('Prde', Icons.developer_board_outlined);


  static const all = <MenuItem>[
    HomePage,
    BranchPage,
    FacilitiesPage,
    ContactUsPage,
    DeveloperPage,
    Faculty_Search_List,
    Student_Search_List,
    Course_Search_List,
    Prde,
  ];
}

class MenuPage extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  const MenuPage({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        // backgroundColor: Colors.,
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
                        NetworkImage("http://103.141.241.97/images/Logo_.png"),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10),
                  child: Text(
                    'Hello Users!',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                //Spacer(),
                Padding(padding: EdgeInsets.only(top: 50)),
                ...MenuItems.all.map(buildMenuItem).toList(),
                Spacer(flex: 2),
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItem(MenuItem item) => ListTileTheme(
        //selectedColor: Colors.white,
        child: ListTile(
          // selectedTileColor: Colors.black,
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

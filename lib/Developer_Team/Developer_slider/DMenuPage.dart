import 'package:flutter/material.dart';
import 'DMenuItem.dart';

class DMenuItems {
  static const HomePage = DMenuItem('Home', Icons.home);
  static const Developer_Add_Data = DMenuItem('Add', Icons.person_add_outlined);
  static const Notice = DMenuItem('Notice', Icons.mark_email_unread_outlined);
  static const BranchPage = DMenuItem('Branch', Icons.celebration);
  static const FacilitiesPage = DMenuItem('Facilities', Icons.view_comfortable);
  static const ContactUsPage = DMenuItem('Contact_Us', Icons.phone);
  static const DeveloperPage =
      DMenuItem('App_Developer', Icons.developer_board_outlined);
  static const Create_Exam =
      DMenuItem('Create Exam', Icons.developer_board_outlined);

  static const all = <DMenuItem>[
    HomePage,
    Developer_Add_Data,
    Notice,
    BranchPage,
    FacilitiesPage,
    ContactUsPage,
    DeveloperPage,
    Create_Exam,
  ];
}

class DMenuPage extends StatelessWidget {
  const DMenuPage(
      {Key? key,
      required this.currentItem,
      required this.onSelectedItem,
      required this.username})
      : super(key: key);
  final DMenuItem currentItem;
  final ValueChanged<DMenuItem> onSelectedItem;
  final String username;

  @override
  Widget build(BuildContext context) => Scaffold(
        //backgroundColor: Colors.grey[400],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10),
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                      'https://image3.mouthshut.com/images/imagesp/925888452s.jpg'),
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
              ...DMenuItems.all.map(buildMenuItem).toList(),
              Spacer(flex: 2),
            ],
          ),
        ),
      );

  Widget buildMenuItem(DMenuItem item) => ListTileTheme(
        //selectedColor: Colors.white,
        child: ListTile(
          //selectedTileColor: Colors.black26,
          selected: currentItem == item,
          minLeadingWidth: 20,
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () => onSelectedItem(item),
        ),
      );
}

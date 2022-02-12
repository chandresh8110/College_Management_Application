import 'package:final_app/Add_Data/Add_Student.dart';
import 'package:flutter/material.dart';
import 'FMenuItem.dart';




class FMenuItems {
  static const HomePage = FMenuItem('Home', Icons.home);
  static const Add_Student = FMenuItem('Add Student', Icons.person_add_outlined);
  static const BranchPage = FMenuItem('Branch', Icons.celebration);
  static const FacilitiesPage = FMenuItem('Facilities', Icons.view_comfortable);
  static const ContactUsPage = FMenuItem('Contact_Us', Icons.phone);
  static const DeveloperPage = FMenuItem('App_Developer', Icons.developer_board_outlined);



  static const all = <FMenuItem>[
    HomePage,
    Add_Student,
    BranchPage,
    FacilitiesPage,
    ContactUsPage,
    DeveloperPage,
  ];

}

class FMenuPage extends StatelessWidget {
  final FMenuItem currentItem;
  final ValueChanged<FMenuItem> onSelectedItem;

  const FMenuPage({Key? key,required this.currentItem,required this.onSelectedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    //backgroundColor: Colors.grey[400],
    body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage('https://image3.mouthshut.com/images/imagesp/925888452s.jpg'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            child: Text('Hello Users!',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          //Spacer(),
          Padding(
              padding: EdgeInsets.only(top: 50)
          ),
          ...FMenuItems.all.map(buildMenuItem).toList(),
          Spacer(flex: 2),
        ],
      ),
    ),
  );

  Widget buildMenuItem(FMenuItem item) => ListTileTheme(
    //selectedColor: Colors.white,
    child: ListTile(
      //selectedTileColor: Colors.black26,
      selected:  currentItem == item,
      minLeadingWidth: 20,
      leading: Icon(item.icon),
      title: Text(item.title),
      onTap: () => onSelectedItem(item),
    ),
  );
}
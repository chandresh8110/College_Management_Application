import 'package:final_app/HOD_Side/HOD%20Dart/HOD_Add_Data.dart';
import 'package:final_app/Student%20Side/Student_Slider/SMenuItem.dart';
import 'package:flutter/material.dart';

import 'HMenuItem.dart';




class HMenuItems {
  static const HomePage = HMenuItem('Home', Icons.home);
  static const HOD_Add_Data = HMenuItem('Add', Icons.person_add_outlined);
  static const BranchPage = HMenuItem('Branch', Icons.celebration);
  static const FacilitiesPage = HMenuItem('Facilities', Icons.view_comfortable);
  static const ContactUsPage = HMenuItem('Contact_Us', Icons.phone);
  static const DeveloperPage = HMenuItem('App_Developer', Icons.developer_board_outlined);



  static const all = <HMenuItem>[
    HomePage,
    HOD_Add_Data,
    BranchPage,
    FacilitiesPage,
    ContactUsPage,
    DeveloperPage,
  ];

}

class HMenuPage extends StatelessWidget {
  final HMenuItem currentItem;
  final ValueChanged<HMenuItem> onSelectedItem;

  const HMenuPage({Key? key,required this.currentItem,required this.onSelectedItem}) : super(key: key);

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
            child: Text('Hello HOD!',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          //Spacer(),
          Padding(
              padding: EdgeInsets.only(top: 50)
          ),
          ...HMenuItems.all.map(buildMenuItem).toList(),
          Spacer(flex: 2),
        ],
      ),
    ),
  );

  Widget buildMenuItem(HMenuItem item) => ListTileTheme(
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

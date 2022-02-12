import 'package:final_app/Student%20Side/Student_Slider/SMenuItem.dart';
import 'package:flutter/material.dart';




class SMenuItems {
  static const HomePage = SMenuItem('Home', Icons.home);
  static const BranchPage = SMenuItem('Branch', Icons.celebration);
  static const FacilitiesPage = SMenuItem('Facilities', Icons.view_comfortable);
  static const ContactUsPage = SMenuItem('Contact_Us', Icons.phone);
  static const DeveloperPage = SMenuItem('App_Developer', Icons.developer_board_outlined);



  static const all = <SMenuItem>[
    HomePage,
    BranchPage,
    FacilitiesPage,
    ContactUsPage,
    DeveloperPage,
  ];

}

class SMenuPage extends StatelessWidget {
  final SMenuItem currentItem;
  final ValueChanged<SMenuItem> onSelectedItem;

  const SMenuPage({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

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
            child: Text('Hello Student!',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          //Spacer(),
          Padding(
              padding: EdgeInsets.only(top: 50)
          ),
          ...SMenuItems.all.map(buildMenuItem).toList(),
          Spacer(flex: 2),
        ],
      ),
    ),
  );

  Widget buildMenuItem(SMenuItem item) => ListTileTheme(
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

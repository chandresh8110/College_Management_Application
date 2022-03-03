import 'package:final_app/Student%20Side/Student%20Dart/StudentHomePage.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'MenuItem.dart';
//import 'MenuWidget.dart';

class MenuItems {
  static const HomePage = MenuItem('Home', Icons.home);
  static const BranchPage = MenuItem('Branch', Icons.celebration);
  static const FacilitiesPage = MenuItem('Facilities', Icons.view_comfortable);
  static const ContactUsPage = MenuItem('Contact_Us', Icons.phone);
  static const DeveloperPage = MenuItem('App_Developer', Icons.developer_board_outlined);
  static const AccountPage = MenuItem('Login', Icons.login_outlined);
  //static const SHomePage = MenuItem('Student Home Page', Icons.home_work);


  static const all = <MenuItem>[
    HomePage,
    BranchPage,
    FacilitiesPage,
    ContactUsPage,
    DeveloperPage,
    AccountPage,
   //SHomePage,
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
               Colors.red,
               // Colors.indigo,
               Colors.teal,
               // Colors.purpleAccent,
               // Colors.deepOrange,
             ],
           )
         ),
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
      // selectedTileColor: Colors.black26,
      // selectedColor: Colors.red,
      selected:  currentItem == item,
      minLeadingWidth: 20,
      leading: Icon(item.icon),
      title: Text(item.title),
      onTap: () => onSelectedItem(item),
    ),
  );
}

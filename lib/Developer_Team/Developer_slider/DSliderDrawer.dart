import 'package:final_app/Developer_Team/Developer_Dart/Developer_Add_Data.dart';
import 'package:final_app/Developer_Team/DoNotTouch/DBottomNaviPage.dart';
import 'package:final_app/Notice/Developer_Notice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../BranchPage.dart';
import '../../Contact_us.dart';
import '../../Developed_By.dart';
import '../../FacilitiesPage.dart';
import 'DMenuItem.dart';
import 'DMenuPage.dart';




class DSliderDrawer extends StatefulWidget {
  const DSliderDrawer({Key? key}) : super(key: key);

  @override
  _DSliderDrawerState createState() => _DSliderDrawerState();
}

class _DSliderDrawerState extends State<DSliderDrawer> {
  DMenuItem currentItem = DMenuItems.HomePage;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: ZoomDrawer(
        style: DrawerStyle.Style1,
        borderRadius: 40,
        angle: -10,
        slideWidth: MediaQuery.of(context).size.width * 0.8,
        showShadow: true,
        backgroundColor: Colors.orangeAccent,
        menuScreen: Builder(
          builder: (context) => DMenuPage(
            currentItem: currentItem,
            onSelectedItem :(item){
              setState(() => currentItem = item);
              ZoomDrawer.of(context)!.close();
            },
          ),
        ),
        mainScreen: getScreen(),
      ),
    ),
  );

  getScreen() {
    switch (currentItem){
      case DMenuItems.HomePage:
        return DBottomNaviPage();
      case DMenuItems.Developer_Add_Data:
        return Developer_Add_Data();
      case DMenuItems.Notice:
        return Developer_Notice();
      case DMenuItems.BranchPage:
        return BranchPage();
      case DMenuItems.FacilitiesPage:
        return FacilitiesPage();
      case DMenuItems.ContactUsPage:
        return ContactUsPage();
      case DMenuItems.DeveloperPage:
        return DeveloperPage();
    }
  }

}

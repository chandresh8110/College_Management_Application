import 'package:final_app/Add_Data/Add_Notice.dart';
import 'package:final_app/HOD_Side/DoNotTouch/HBottomNaviPage.dart';
import 'package:final_app/HOD_Side/HOD%20Dart/HOD_Add_Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../BranchPage.dart';
import '../../Contact_us.dart';
import '../../Developed_By.dart';
import '../../FacilitiesPage.dart';
import 'HMenuItem.dart';
import 'HMenuPage.dart';




class HSliderDrawer extends StatefulWidget {
  const HSliderDrawer({Key? key}) : super(key: key);

  @override
  _HSliderDrawerState createState() => _HSliderDrawerState();
}

class _HSliderDrawerState extends State<HSliderDrawer> {
  HMenuItem currentItem = HMenuItems.HomePage;

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
          builder: (context) => HMenuPage(
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
      case HMenuItems.HomePage:
        return HBottomNaviPage();
      case HMenuItems.HOD_Add_Data:
        return HOD_Add_Data();
      case HMenuItems.Add_Notice:
        return Add_Notice();
      case HMenuItems.BranchPage:
        return BranchPage();
      case HMenuItems.FacilitiesPage:
        return FacilitiesPage();
      case HMenuItems.ContactUsPage:
        return ContactUsPage();
      case HMenuItems.DeveloperPage:
        return DeveloperPage();
    }
  }

}

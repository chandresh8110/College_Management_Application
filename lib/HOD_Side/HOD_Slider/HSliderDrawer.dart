import 'package:final_app/HOD_Side/DoNotTouch/HBottomNaviPage.dart';
import 'package:final_app/HOD_Side/HOD%20Dart/HOD_Add_Members.dart';
import 'package:final_app/HOD_Side/HOD%20Dart/HOD_Add_Things.dart';
import 'package:final_app/Material/HOD_View_Material.dart';
import 'package:final_app/Notice/HOD_Notice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../Branch/BranchPage.dart';
import '../../General Side/Contact_us.dart';
import '../../General Side/Developed_By.dart';
import '../../General Side/FacilitiesPage.dart';
import 'HMenuItem.dart';
import 'HMenuPage.dart';

class HSliderDrawer extends StatefulWidget {
  const HSliderDrawer({Key? key, required this.username}) : super(key: key);

  final String username;

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
                onSelectedItem: (item) {
                  setState(() => currentItem = item);
                  ZoomDrawer.of(context)!.close();
                },
                username: widget.username,
              ),
            ),
            mainScreen: getScreen(),
          ),
        ),
      );

  getScreen() {
    switch (currentItem) {
      case HMenuItems.HomePage:
        return HBottomNaviPage();
      case HMenuItems.HOD_Add_Members:
        return HOD_Add_Members();
      case HMenuItems.HOD_Add_Things:
        return HOD_Add_Things();
      case HMenuItems.Notice:
        return HOD_Notice();
      case HMenuItems.Material:
        return HOD_View_Material(username: widget.username);
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

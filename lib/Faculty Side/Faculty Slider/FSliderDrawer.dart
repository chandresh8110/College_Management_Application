import 'package:final_app/Notice/Add_Notice.dart';
import 'package:final_app/Faculty%20Side/DoNotTouch/FBottomNaviPage.dart';
import 'package:final_app/Faculty%20Side/Faculty_Dart/Faculty_Add_Data.dart';
import 'package:final_app/Notice/Faculty_Notice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../BranchPage.dart';
import '../../Contact_us.dart';
import '../../Developed_By.dart';
import '../../FacilitiesPage.dart';
import 'FMenuItem.dart';
import 'FMenuPage.dart';







class FSliderDrawer extends StatefulWidget {
  const FSliderDrawer({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  _FSliderDrawerState createState() => _FSliderDrawerState();
}

class _FSliderDrawerState extends State<FSliderDrawer> {
  FMenuItem currentItem = FMenuItems.HomePage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ZoomDrawer(
          style: DrawerStyle.Style1,
          borderRadius: 40,
          angle: -10,
          slideWidth: MediaQuery
              .of(context)
              .size
              .width * 0.8,
          showShadow: true,
          backgroundColor: Colors.orangeAccent,
          menuScreen: Builder(
            builder: (context) =>
                FMenuPage(
                  currentItem: currentItem,
                  onSelectedItem: (item) {
                    setState(() => currentItem = item);
                    ZoomDrawer.of(context)!.close();
                  }, username: widget.username,
                ),
          ),
          mainScreen: getScreen(),
        ),
      ),
    );
  }


  getScreen() {
    switch (currentItem) {
      case FMenuItems.HomePage:
        return FBottomNaviPage();
      case FMenuItems.Add:
        return Faculty_Add_Data();
      case FMenuItems.Notice:
        return Faculty_Notice();
      case FMenuItems.BranchPage:
        return BranchPage();
      case FMenuItems.FacilitiesPage:
        return FacilitiesPage();
      case FMenuItems.ContactUsPage:
        return ContactUsPage();
      case FMenuItems.DeveloperPage:
        return DeveloperPage();
    }
  }
}
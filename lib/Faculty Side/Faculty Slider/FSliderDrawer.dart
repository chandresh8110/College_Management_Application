import 'package:final_app/Add_Data/Add_Student.dart';
import 'package:final_app/Faculty%20Side/DoNotTouch/FBottomNaviPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../BranchPage.dart';
import '../../Contact_us.dart';
import '../../Developed_By.dart';
import '../../FacilitiesPage.dart';
import 'FMenuItem.dart';
import 'FMenuPage.dart';







class FSliderDrawer extends StatefulWidget {
  const FSliderDrawer({Key? key}) : super(key: key);

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
                  },
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
      case FMenuItems.Add_Student:
        return Add_Student();
      case FMenuItems.BranchPage:
        return BranchPage();
      case FMenuItems.FacilitiesPage:
        return FacilitiesPage();
      case FMenuItems.ContactUsPage:
        return ContactUsPage();
      case FMenuItems.DeveloperPage:
        return DeveloperPage();
      // case FMenuItems.AccountPage:
      //   return AccountPage();
    // case MenuItems.SHomePage:
    //   return SHomePage();
    }
  }
}
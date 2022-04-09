import 'package:final_app/Marks/Student_Marks_view.dart';
import 'package:final_app/Material/Student_Material_View.dart';
import 'package:final_app/Notice/Notice_View_Student.dart';
import 'package:final_app/Profile/Setting_page.dart';
import 'package:final_app/Student%20Side/DoNotTouch/SBottomNaviPage.dart';
import 'package:final_app/Student%20Side/Student%20Dart/StudentHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../Branch/BranchPage.dart';
import '../../General Side/Contact_us.dart';
import '../../General Side/Developed_By.dart';
import '../../General Side/FacilitiesPage.dart';
import 'SMenuItem.dart';
import 'SMenuPage.dart';

class SSliderDrawer extends StatefulWidget {
  const SSliderDrawer({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  _SSliderDrawerState createState() => _SSliderDrawerState();
}

class _SSliderDrawerState extends State<SSliderDrawer> {
  SMenuItem currentItem = SMenuItems.HomePage;

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
              builder: (context) => SMenuPage(
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
      case SMenuItems.HomePage:
        return SHomePage(
          username: widget.username,
        );
      case SMenuItems.Notice_View_Student:
        return Notice_View_Student(
          username: widget.username,
        );
      case SMenuItems.Student_Material_View:
        return Student_Material_View(
          username: widget.username,
        );
      // case SMenuItems.BranchPage:
      //   return BranchPage();
      // case SMenuItems.FacilitiesPage:
      //   return FacilitiesPage();
      // case SMenuItems.ContactUsPage:
      //   return ContactUsPage();
      case SMenuItems.Marksview:
        return Student_Marks_view(
          username: widget.username,
        );
      case SMenuItems.Profile_page:
        return Profile_page(username: widget.username);
    }
  }
}

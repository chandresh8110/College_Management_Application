import 'package:final_app/Attedance/Attedance_First_page.dart';
import 'package:final_app/HOD_Side/DoNotTouch/HBottomNaviPage.dart';
import 'package:final_app/HOD_Side/HOD%20Dart/HODHomePage.dart';
import 'package:final_app/HOD_Side/HOD%20Dart/HOD_Add_Members.dart';
import 'package:final_app/HOD_Side/HOD%20Dart/HOD_Add_Things.dart';
import 'package:final_app/Marks/Add_Marks_FPG.dart';
import 'package:final_app/Material/HOD_View_Material.dart';
import 'package:final_app/Notice/HOD_Notice.dart';
import 'package:final_app/Profile/HOD_Setting_Page.dart';
import 'package:final_app/Search/Student_HOD_Search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../Branch/BranchPage.dart';
import '../../Exam/Select_Exam_Sub_First_Page.dart';
import '../../General Side/Contact_us.dart';
import '../../General Side/Developed_By.dart';
import '../../General Side/FacilitiesPage.dart';
import '../HOD Dart/HOD_Edit_Details.dart';
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
        return HHomePage(
          username: widget.username,
        );
      case HMenuItems.HOD_Add_Members:
        return HOD_Add_Members(
          username: widget.username,
        );
      case HMenuItems.HOD_Add_Things:
        return HOD_Add_Things(
          username: widget.username,
        );
      case HMenuItems.Notice:
        return HOD_Notice(
          username: widget.username,
        );
      case HMenuItems.Material:
        return HOD_View_Material(
          username: widget.username,
        );
      case HMenuItems.HOD_Edit_Details:
        return HOD_Edit_Details(
          username: widget.username,
        );
      case HMenuItems.HOD_Setting_page:
        return HOD_Setting_page(
          username: widget.username,
        );
      case HMenuItems.Select_Exam_Sub:
        return Select_Exam_Sub(
          username: widget.username,
        );
      case HMenuItems.Add_Marks_FP:
        return Add_Marks_FP(
          username: widget.username,
        );
      case HMenuItems.Attedance:
        return attendence(
          username: widget.username,
        );
      // case HMenuItems.DeveloperPage:
      //   return DeveloperPage();
    }
  }
}

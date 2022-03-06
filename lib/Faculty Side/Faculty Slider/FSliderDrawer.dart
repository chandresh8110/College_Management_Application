import 'package:final_app/Faculty%20Side/Faculty_Dart/FacultyHomePage.dart';
import 'package:final_app/Material/Faculty_View_Material.dart';
import 'package:final_app/Faculty%20Side/Faculty_Dart/Faculty_Add_Data.dart';
import 'package:final_app/Notice/Faculty_Notice.dart';
import 'package:final_app/Profile/Faculty_Setting_Page.dart';
import 'package:final_app/Search/Student_Faculty_Search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
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
          slideWidth: MediaQuery.of(context).size.width * 0.8,
          showShadow: true,
          backgroundColor: Colors.orangeAccent,
          menuScreen: Builder(
            builder: (context) => FMenuPage(
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
  }

  getScreen() {
    switch (currentItem) {
      case FMenuItems.HomePage:
        return FHomePage(
          username: widget.username,
        );
      case FMenuItems.Add:
        return Faculty_Add_Data(
          username: widget.username,
        );
      case FMenuItems.Notice:
        return Faculty_Notice(
          username: widget.username,
        );
      case FMenuItems.Material:
        return Faculty_View_Material(
          username: widget.username,
        );
      case FMenuItems.Student_Faculty_Search:
        return Student_Faculty_Search(
          username: widget.username,
        );
      case FMenuItems.Faculty_Setting_page:
        return Faculty_Setting_page(
          username: widget.username,
        );
      // case FMenuItems.ContactUsPage:
      //   return ContactUsPage();
      // case FMenuItems.DeveloperPage:
      //   return DeveloperPage();
    }
  }
}

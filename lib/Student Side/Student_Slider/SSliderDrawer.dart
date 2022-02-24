import 'package:final_app/Profile/profile_page.dart';
import 'package:final_app/Student%20Side/DoNotTouch/SBottomNaviPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../BranchPage.dart';
import '../../Contact_us.dart';
import '../../Developed_By.dart';
import '../../FacilitiesPage.dart';
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
            onSelectedItem :(item){
              setState(() => currentItem = item);
              ZoomDrawer.of(context)!.close();
            }, username: widget.username,
          ),
        ),
        mainScreen: getScreen(),
      ),
    ),
  );

  getScreen() {
    switch (currentItem){
      case SMenuItems.HomePage:
        return SBottomNaviPage();
      case SMenuItems.BranchPage:
        return BranchPage();
      case SMenuItems.FacilitiesPage:
        return FacilitiesPage();
      case SMenuItems.ContactUsPage:
        return ContactUsPage();
      case SMenuItems.DeveloperPage:
        return DeveloperPage();
      case SMenuItems.Profile_page:
        return Profile_page(username: widget.username);
    }
  }

}

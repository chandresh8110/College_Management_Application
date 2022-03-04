import 'package:final_app/General%20Side/FacilitiesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../General Side/AccountPage.dart';
import '../Branch/BranchPage.dart';
import '../General Side/Contact_us.dart';
import '../General Side/Developed_By.dart';
import '../DoNotTouch/BottomNaviPage.dart';
import 'MenuItem.dart';
import 'MenuPage.dart';


class SliderDrawer extends StatefulWidget {
  const SliderDrawer({Key? key}) : super(key: key);

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<SliderDrawer> {
  MenuItem currentItem = MenuItems.HomePage;

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
          builder: (context) => MenuPage(
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
     case MenuItems.HomePage:
       return BottomNaviPage();
     case MenuItems.BranchPage:
       return BranchPage();
     case MenuItems.FacilitiesPage:
       return FacilitiesPage();
     case MenuItems.ContactUsPage:
       return ContactUsPage();
     case MenuItems.DeveloperPage:
       return DeveloperPage();
   }
 }

}

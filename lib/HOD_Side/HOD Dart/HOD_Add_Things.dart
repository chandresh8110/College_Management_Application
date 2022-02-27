import 'package:final_app/Add_Data/Add_Branch.dart';
import 'package:final_app/Add_Data/Add_Course.dart';
import 'package:final_app/HOD_Side/HOD_Slider/HMenuWidget.dart';
import 'package:flutter/material.dart';




class HOD_Add_Things extends StatefulWidget {
  const HOD_Add_Things({Key? key}) : super(key: key);

  @override
  _HOD_Add_ThingsState createState() => _HOD_Add_ThingsState();
}

class _HOD_Add_ThingsState extends State<HOD_Add_Things> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                backgroundColor: Colors.blue,
                floating: true,
                pinned: true,
                title: Text('Add_Data'),
                leading: HMenuWidget(),
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Add_Course',),
                    Tab(text: 'Add_Branch',),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Add_Course(),
              Add_Branch(),
            ],
          ),
        ),
      ),
    );
  }
}

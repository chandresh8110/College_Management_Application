import 'package:final_app/Add_Data/Add_Course.dart';
import 'package:final_app/Add_Data/Add_Faculty.dart';
import 'package:final_app/Add_Data/Add_Student.dart';
import 'package:final_app/HOD_Side/HOD_Slider/HMenuWidget.dart';
import 'package:flutter/material.dart';






class HOD_Add_Data extends StatefulWidget {
  const HOD_Add_Data({Key? key}) : super(key: key);

  @override
  _HOD_Add_DataState createState() => _HOD_Add_DataState();
}

class _HOD_Add_DataState extends State<HOD_Add_Data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
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
                    Tab(text: 'Add_Student'),
                    Tab(text: 'Add_Faculty'),
                    Tab(text: 'Add_Course',)
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Add_Student(),
              Add_Faculty(),
              Add_Course(),
            ],
          ),
        ),
      ),
    );
  }
}

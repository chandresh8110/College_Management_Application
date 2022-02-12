import 'package:final_app/Add_Data/Add_Course.dart';
import 'package:final_app/Add_Data/Add_Student.dart';
import 'package:final_app/HOD_Side/HOD_Slider/HMenuWidget.dart';
import 'package:flutter/material.dart';



class Faculty_Add_Data extends StatefulWidget {
  const Faculty_Add_Data({Key? key}) : super(key: key);

  @override
  _Faculty_Add_DataState createState() => _Faculty_Add_DataState();
}

class _Faculty_Add_DataState extends State<Faculty_Add_Data> {
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
                    Tab(text: 'Add_Student'),
                    Tab(text: 'Add_Course',)
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Add_Student(),
              Add_Course(),
            ],
          ),
        ),
      ),
    );
  }
}

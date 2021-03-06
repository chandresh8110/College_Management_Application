// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:final_app/Add_Data/Add_Course.dart';
import 'package:final_app/Add_Data/Add_Faculty.dart';
import 'package:final_app/Add_Data/Add_Student.dart';
import 'package:final_app/Developer_Team/Developer_slider/DMenuWidget.dart';
import 'package:flutter/material.dart';

class Developer_Add_Data extends StatefulWidget {
  const Developer_Add_Data({Key? key}) : super(key: key);

  @override
  _Developer_Add_DataState createState() => _Developer_Add_DataState();
}

class _Developer_Add_DataState extends State<Developer_Add_Data> {
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
                leading: DMenuWidget(),
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Add_Student'),
                    Tab(text: 'Add_Faculty'),
                    Tab(
                      text: 'Add_Course',
                    ),
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

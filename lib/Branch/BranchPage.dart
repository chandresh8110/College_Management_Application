import 'package:flutter/material.dart';
import 'BE.dart';
import 'DE.dart';
import '../slider/MenuWidget.dart';

class BranchPage extends StatelessWidget {
  const BranchPage({Key? key}) : super(key: key);

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
                title: Text('BranchPage'),
                leading: MenuWidget(),
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Bachelor of Engineering'),
                    Tab(text: 'Diploma Engineering'),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              BE(),
              DE(),
            ],
          ),
        ),
      ),
    );
  }
}

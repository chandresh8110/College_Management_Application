import 'package:flutter/material.dart';
import 'slider/MenuWidget.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: CustomScrollView(
      slivers:[
        SliverAppBar(
          backgroundColor: Colors.blue,
          floating: true,
          //pinned: true,
          title: Text('Chat Room'),
          leading: MenuWidget(),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 700,
            //color: Colors.greenAccent,
            child: Center(
              child: Text('Coming Soon',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ),
        ),
      ]
    ),
  );
}
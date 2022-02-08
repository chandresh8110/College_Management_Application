import 'package:flutter/material.dart';






class Sports extends StatelessWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.blue,
                title: Text(
                    'Sports'
                ),
              ),
            ]
        )
    );
  }
}

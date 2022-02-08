import 'package:flutter/material.dart';






class Visits extends StatelessWidget {
  const Visits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.blue,
                title: Text(
                    'Visits'
                ),
              ),
            ]
        )
    );
  }
}

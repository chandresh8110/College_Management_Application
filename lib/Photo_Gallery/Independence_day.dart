import 'package:flutter/material.dart';






class Independance_Day extends StatelessWidget {
  const Independance_Day({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
            slivers: [
              SliverAppBar(
                  backgroundColor: Colors.blue,
                  title: Text(
                    'Independence_Day'
              ),
          ),
        ]
      )
    );
  }
}

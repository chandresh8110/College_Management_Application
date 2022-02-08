import 'package:flutter/material.dart';






class Teachers_Day extends StatelessWidget {
  const Teachers_Day({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.blue,
                title: Text(
                    'Teachers_Day'
                ),
              ),
            ]
        )
    );
  }
}

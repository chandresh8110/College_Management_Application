import 'package:flutter/material.dart';






class TechFest extends StatelessWidget {
  const TechFest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.blue,
                title: Text(
                    'TechFest'
                ),
              ),
            ]
        )
    );
  }
}

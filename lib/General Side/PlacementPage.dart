import 'package:flutter/material.dart';
import '../slider/MenuWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../slider/SliderDrawer.dart';

class PlacementPage extends StatefulWidget {
  const PlacementPage({Key? key}) : super(key: key);

  @override
  _PlacementPageState createState() => _PlacementPageState();
}

class _PlacementPageState extends State<PlacementPage> {
  final urlImages1 = [
    'https://picsum.photos/seed/image005/3216/2144',
    'https://picsum.photos/seed/image006/3216/2144',
    'https://picsum.photos/seed/image007/3216/2144',
    'https://picsum.photos/seed/image008/3216/2144',
  ];
  final urlImages2 = [
    'https://picsum.photos/seed/image005/3216/2144',
    'https://picsum.photos/seed/image006/3216/2144',
    'https://picsum.photos/seed/image007/3216/2144',
    'https://picsum.photos/seed/image008/3216/2144',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: CustomScrollView(slivers: [
          SliverAppBar(
            backgroundColor: Colors.blue,
            floating: true,
            //pinned: true,
            title: Text('PlacementPage'),
            leading: MenuWidget(),
          ),
          SliverToBoxAdapter(
            child: Container(
              //color:Colors.amber,
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              //color:Colors.yellow,
              // height: 145,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                '        Apollo Institute of Engineering And Technology has an excellent track record of placements, most of the alumni have been placed across the state in various sectors, functions & levels.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 0.9,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              //color:Colors.greenAccent,
              height: 50,
              child: Center(
                child: Text(
                  'Recent Placements',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 430,
              //color: Colors.yellow,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: 400,
                  autoPlay: true,
                  //viewportFraction: 1,
                  enlargeCenterPage: true,
                ),
                itemCount: urlImages1.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = urlImages1[index];
                  return buildImage(urlImage, index);
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              //color:Colors.amber,
              height: 40,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                'Some of our initiatives include :- ',
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 0.9,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              //color:Colors.amber,
              // height: 565,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                '👉Tours to culturally & social Diverse companies.'
                '\n👉Exchange of ideas & interactions with industry leaders.'
                '\n👉Live projects & internship (summer & winter)'
                '\n👉Corporate Tie Ups.'
                '\n👉Conduct lectures, seminars, industry integration, business immersion (internship), group discussion, live projects & capstone exercise.'
                '\n👉Curriculum design keeping the global trends in view.'
                '\n👉AIET collaborations with various agencies to bring in the best career opportunities for students through periodic job fairs.'
                '\n👉Expert faculty members from different universities.'
                '\n👉Student exchange programme with various universities across India.'
                '\n👉Seminars by experts on different subjects.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 0.9,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              //color:Colors.amber,
              height: 50,
              child: Center(
                child: Text(
                  'Collaborators',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 430,
              //color: Colors.amber,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: 400,
                  autoPlay: true,
                  //viewportFraction: 1,
                  enlargeCenterPage: true,
                ),
                itemCount: urlImages2.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = urlImages2[index];
                  return buildImage(urlImage, index);
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              //color:Colors.amber,
              height: 60,
            ),
          ),
        ]),
      ),
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SliderDrawer(),
          ),
        );
        return false;
      },
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        color: Colors.grey,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
}

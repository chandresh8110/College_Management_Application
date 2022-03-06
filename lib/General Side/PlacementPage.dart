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
    'images/Students/P1.png',
    'images/Students/P2.png',
    'images/Students/P3.png',
    'images/Students/P4.png',
    'images/Students/P5.png',
    'images/Students/P6.png',
    'images/Students/P7.png',
    'images/Students/P8.png',
    'images/Students/P9.png',
    'images/Students/P10.png',
    'images/Students/P11.png',
    'images/Students/P12.png',
    'images/Students/P13.png',
    'images/Students/P14.png',
    'images/Students/P15.png',
  ];

  final urlImages2 = [
    'images/Placement/accenture.png',
    'images/Placement/adani.png',
    'images/Placement/cess.png',
    'images/Placement/einfochips.png',
    'images/Placement/ford.png',
    'images/Placement/ibm.png',
    'images/Placement/mahindra.png',
    'images/Placement/md.png',
    'images/Placement/tcs.png',
    'images/Placement/zydus.png',
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
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.cyanAccent,
                      Colors.blue,
                    ]),
              ),
            ),
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
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                // height: 430,
                //color: Colors.yellow,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    // height: 400,
                    autoPlay: true,
                    viewportFraction: 1,
                    // enlargeCenterPage: true,
                  ),
                  itemCount: urlImages1.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = urlImages1[index];
                    return buildImage(urlImage, index);
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
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
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    decoration: TextDecoration.underline
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              // height: 430,
              //color: Colors.amber,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  // height: 400,
                  autoPlay: true,
                  viewportFraction: 1,
                  // enlargeCenterPage: true,
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
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      );
}

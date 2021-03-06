import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../slider/MenuWidget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final urlImages1 = [
    'http://103.141.241.97/Images/Campus1.svg',
    'http://103.141.241.97/Images/Campus2.svg',
    'http://103.141.241.97/Images/Campus3.svg',
    'http://103.141.241.97/Images/Campus4.svg',
    'http://103.141.241.97/Images/Campus5.svg',
    'http://103.141.241.97/Images/Campus6.svg',
    'http://103.141.241.97/Images/Campus7.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: Text('HomePage'),
            leading: MenuWidget(),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.cyanAccent,
                    Colors.blue,
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 420,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: 400,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 1),
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
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              // color: Colors.redAccent,
              child: Text(
                '       Apollo Institute of Engineering and Technology is one of the premier institutes for imparting quality technical education and keeping pace with the ever-changing world of Technology. The institute is established under the aegis of Divaba Education trust.'
                '\n       The College is approved by AICTE and affiliated with GTU (Gujarat Technological University).',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 40,
              padding: const EdgeInsets.only(left: 10, right: 10),
              //color: Colors.greenAccent,
              child: Text(
                'Major Assets of AIET :- ',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              // height: 250,
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              // color: Colors.greenAccent,
              child: Text(
                '???? Disciplined Environment'
                '\n???? Skill Development Activities'
                '\n???? Industry Interaction & Consultancy Work'
                '\n???? Research Facility'
                '\n???? Carrier Guidance Cell'
                '\n???? Entrepreneurship Cell'
                '\n???? Dedicated Placement Cell'
                '\n???? Extra-curricular Cell'
                '\n???? Events',
                style: TextStyle(
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 40,
              //color: Colors.amber,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                'Seats & Intake :-',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 40,
              //color: Colors.amber,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Center(
                child: Text(
                  'Bachelor of Engineering',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Table(
              columnWidths: {
                0: FractionColumnWidth(0.70),
                1: FractionColumnWidth(0.15),
              },
              children: [
                buildRow(['Branch', 'Seats'], isHeader: true),
                buildRow(['Information Technology', '120']),
                buildRow(['Computer Engineering', '60']),
                buildRow(['Mechanical Engineering', '60']),
                buildRow(['Artificial Intelligence and Data Science', '60']),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 40,
              //color: Colors.amber,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Center(
                child: Text(
                  'Diploma Engineering',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Table(
              columnWidths: {
                0: FractionColumnWidth(0.70),
                1: FractionColumnWidth(0.15),
              },
              children: [
                buildRow(['Branch', 'Seats'], isHeader: true),
                buildRow(['Computer Engineering', '120']),
                buildRow(['Mechanical Engineering', '60']),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 70,
              //color: Colors.greenAccent,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SvgPicture.network(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      );

  TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
        children: cells.map((cell) {
          final style = TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            fontSize: 18,
          );
          return Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Text(cell, style: style),
          );
        }).toList(),
      );
}

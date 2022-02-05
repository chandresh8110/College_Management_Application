import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:photo_view/photo_view.dart';
import 'slider/MenuWidget.dart';



class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final urlImages1 = [
    'images/SVG/Campus1.svg',
    'images/SVG/Campus2.svg',
    'images/SVG/Campus3.svg',
    'images/SVG/Campus4.svg',
    'images/SVG/Campus5.svg',
    'images/SVG/Campus6.svg',
    'images/SVG/Campus7.svg',

  ];

  // late List<User> users;
  // @override
  // void initState() {
  //   super.initState();
  //
  //   this.users = List.of(allUsers);
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blue,
              floating: true,
              //pinned: true,
              title: Text('HomePage'),
              leading: MenuWidget(),
            ),
            SliverToBoxAdapter(
              child: Container(
                //color: Colors.greenAccent,
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 300,
                //color: Colors.amber,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 400,
                    autoPlay: true,
                    // autoPlayAnimationDuration: Duration(milliseconds: 50),
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
                height: 10,
                //color: Colors.amber,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 500,
                padding: const EdgeInsets.only(left: 10, right: 10),
                //color: Colors.redAccent,
                child: Text('       Apollo Institute of Engineering and Technology is one of the premier institutes for imparting quality technical education and keeping pace with the ever-changing world of Technology. The institute is established under the aegis of Divaba Education trust.'
                    '\n       The college started its academic term in the year 2014 and offers Bachelor of Engineering in various disciplines like Civil Engineering, Computer Engineering, Electrical Engineering, Information Technology, Mechanical Engineering.'
                    '\n       We also offer Diploma Engineering in different streams like Civil Engineering, Computer Engineering and Mechanical Engineering.'
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
                child: Text('Major Assets of AIET :- ',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 250,
                padding: const EdgeInsets.only(left: 10, right: 10),
                //color: Colors.greenAccent,
                child: Text('👉 Disciplined Environment'
                    '\n👉 Skill Development Activities'
                    '\n👉 Industry Interaction & Consultancy Work'
                    '\n👉 Research Facility'
                    '\n👉 Carrier Guidance Cell'
                    '\n👉 Entrepreneurship Cell'
                    '\n👉 Dedicated Placement Cell'
                    '\n👉 Extra-curricular Cell'
                    '\n👉 Events',
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
                child: Text('Seats & Intake :-',
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
                  child: Text('Bachelor of Engineering',
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
                  buildRow(['Branch', 'Seats'],isHeader: true),
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
                  child: Text('Diploma Engineering',
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
                  buildRow(['Branch', 'Seats'],isHeader: true),
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
          ]
      ),
    );
  }

  Widget buildImage(String urlImage, int index) =>
      Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        color: Colors.grey,
        child: SvgPicture.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );

  TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
    children: cells.map((cell){
      final style = TextStyle(
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        fontSize: 18,
      );
      return Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
        child: Text(cell,style: style),
    );
    }).toList(),
  );
}

//   Widget buildDataTable() {
//     final columns = ['Branch', 'Seats'];
//
//     return DataTable(
//         columns: getColumns(columns),
//         rows: getRows(users),
//     );
//   }
//
//
//   List<DataColumn>getColumns(List<String> columns) => columns
//       .map((String column) => DataColumn(
//       label: Text(column),
//     ))
//       .toList();
//
//   List<DataRow> getRows(List<User> users) => users.map((User user){
//     final cells = [user.Branch, user.Seats];
//
//     return DataRow(cells:getCells(cells));
//   }).toList();
//
//   List<DataCell> getCells(List <dynamic> cells) =>
//       cells.map((data) => DataCell(Text('$data'))).toList();
//
// }
//
// class User {
//   final String Branch;
//   final String Seats;
//
//   const User({
//    required this.Branch,
//    required this.Seats,
// });
// }
//

//
//
// final allUsers = <User>[
//   User(Branch: 'Information Technology', Seats: '120'),
//   User(Branch: 'Computer Engineering', Seats: '60'),
//   User(Branch: 'Mechanical Engineering', Seats: '60'),
//   User(Branch: 'Artificial Intelligence and Data Science', Seats: '60'),
//
// ];




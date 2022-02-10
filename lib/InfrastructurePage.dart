import 'package:flutter/material.dart';
import 'GallaryPage.dart';




class Infrastructure extends StatelessWidget {
  const Infrastructure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      body: SafeArea(
        child: CustomScrollView(
            slivers: [
              // SliverAppBar(
              //   backgroundColor: Colors.blue,
              //   floating: true,
              //   // pinned: true,
              //   title: Text('InfrastructurePage'),
              // ),
              SliverToBoxAdapter(
                child: Container(
                  height: 10,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  //color:Colors.amber,
                  height: 40,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text('INCUBATION CENTER :-',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 25,
                    letterSpacing: 0.1,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child:  Container(
                  //color:Colors.greenAccent,
                  // height: 470,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text('➡️ The students are encouraged to think out of the box & come out with feasible innovative ideas to solve practical real-life problems. For that, AIET emphasizes the incubation centre to blend passions with the support, structure & resources to address challenging problems with innovative ideas. Top of it, students can enhance their skills of discussion, debate & amp; experiment along with research & development.'
                    '\n\n➡️ The centre is equipped with all modern amenities & an aesthetic work environment. The working space has workstations built for start-up teams equipped with electricity, internet, phone line connections & projector screens to make each workstation a productivity hub.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.99,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context,int index){
                    return RawMaterialButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => PhotoDetails(
                              imagePath: networkNames[index]
                          ),
                        ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: _edgeInsertsForIndex(index),
                        child: Image.network(
                          networkNames[index % networkNames.length],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },childCount: networkNames.length,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  //color:Colors.amber,
                  height: 40,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text('TRANSPORTATION :-',
                    style: TextStyle(
                      color:Colors.redAccent,
                      fontSize: 25,
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child:  Container(
                  //color:Colors.greenAccent,
                  // height: 190,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text('➡️ For security and added comfort, AIET provides the bus facility for student transportation. The college has its own fleet of buses connecting the campus with covering various routes of Ahmedabad city which is beneficial for the students as well as staff members with nominal fares of transportation.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.99,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context,int index){
                    return RawMaterialButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => PhotoDetails(
                              imagePath: networkNames1[index]
                          ),
                        ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: _edgeInsertsForIndex(index),
                        child: Image.network(
                          networkNames1[index % networkNames1.length],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },childCount: networkNames1.length,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  //color:Colors.amber,
                  height: 40,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text('CAFETERIA :-',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 25,
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child:  Container(
                  //color:Colors.greenAccent,
                  // height: 145,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child:Text('➡️ Institute cares for student’s health & AIET emphasizes on healthy & hygienic food, for students as well as staff members. The campus provides a larger area for students to access the cafeteria at the same time.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.99,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context,int index){
                    return RawMaterialButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => PhotoDetails(
                              imagePath: networkNames2[index]
                          ),
                        ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: _edgeInsertsForIndex(index),
                        child: Image.network(
                          networkNames2[index % networkNames2.length],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },childCount: networkNames2.length,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  //color:Colors.amber,
                  height: 40,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text('LIBRARY :-',
                    style: TextStyle(
                      color:Colors.redAccent,
                      fontSize: 25,
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child:  Container(
                  //color:Colors.greenAccent,
                  // height: 280,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child:Text('➡️ AIET Library has nearly 10,000 books. The Library collection includes a large number of reference books, text book collection meant to cater the need for the students in their study & research. The spacious reading area lends a calm & comfortable atmosphere for students & faculty members to pursue excellence in academics.'
                      '\n\n➡️The library is equipped with all modern facilities.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.99,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context,int index){
                    return RawMaterialButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => PhotoDetails(
                              imagePath: networkNames3[index]
                          ),
                        ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: _edgeInsertsForIndex(index),
                        child: Image.network(
                          networkNames3[index % networkNames3.length],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },childCount: networkNames3.length,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  //color:Colors.amber,
                  height: 40,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text('FIRST AID :-',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 25,
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  //color:Colors.greenAccent,
                  // height: 100,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text('➡️ ‘Safety First’ & ‘Safety Always’.'
                      '\n\n➡️Due care has been taken for the health of the students.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.99,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context,int index){
                    return RawMaterialButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => PhotoDetails(
                              imagePath: networkNames4[index]
                          ),
                        ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: _edgeInsertsForIndex(index),
                        child: Image.network(
                          networkNames4[index % networkNames4.length],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },childCount: networkNames4.length,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  //color:Colors.amber,
                  height: 40,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text('AUDITORIUM :-',
                    style: TextStyle(
                      fontSize: 25,
                      letterSpacing: 0.1,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child:  Container(
                  //color:Colors.greenAccent,
                  // height: 150,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child:Text('➡️AIET has a wide auditorium with more than 500 seating capacity, and fitted with open address framework & projection facilities. It is used for organizing training courses, symposium, gatherings, workshops & other expert projects.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.99,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context,int index){
                    return RawMaterialButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => PhotoDetails(
                              imagePath: networkNames5[index]
                          ),
                        ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: _edgeInsertsForIndex(index),
                        child: Image.network(
                          networkNames5[index % networkNames5.length],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },childCount: networkNames5.length,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  //color:Colors.amber,
                  height: 40,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text('WI-FI CAMPUS :-',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 25,
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child:  Container(
                  //color:Colors.greenAccent,
                  // height: 285,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text('➡️In this advanced technical era, the internet is the basic need & is a powerful medium for students to connect to the world. As per need, AIET has provided a high speed 40Mbps Wi-Fi environment which is available 24×7 in the campus premises. In order to avail local server with e-library & other important software laboratories, students can access all the above lab contents from any place in the campus as well as access local server with e-library.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  //color:Colors.amber,
                  height: 40,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text('HOSTEL FACILITIES :-',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.redAccent,
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child:  Container(
                  //color:Colors.greenAccent,
                  // height: 80,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text('➡️AIET also provides hostel facility which is located near college campus for migrated students.',
                      textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
}



EdgeInsets _edgeInsertsForIndex(int index) {
  if (index % 2 == 0) {
    return EdgeInsets.only(top: 0.0, left: 5.0, right: 5.0, bottom: 0.0);
  } else
  {
    return EdgeInsets.only(top: 0.0, left: 5.0, right: 5.0, bottom: 0.0);
  }
}

final List<String> networkNames =[
  'https://aiet.edu.in/wp-content/uploads/2020/08/Incubation-1.jpg',
  'https://aiet.edu.in/wp-content/uploads/2020/08/Oncubation-768x431.jpg',
];

final List<String> networkNames1 =[
  'https://aiet.edu.in/wp-content/uploads/2020/07/image053-768x510.jpg',
  'https://aiet.edu.in/wp-content/uploads/2020/07/DSC5461-600x397.jpg',
];

final List<String> networkNames2 =[
  'https://aiet.edu.in/wp-content/uploads/2020/07/image037.jpg',
  'https://aiet.edu.in/wp-content/uploads/2020/07/DSC5494-600x397.jpg',
];

final List<String> networkNames3 =[
  'https://aiet.edu.in/wp-content/uploads/2020/06/image039-768x508.jpg',
  'https://aiet.edu.in/wp-content/uploads/2020/07/HIT_9712-600x400.jpg',
];

final List<String> networkNames4 =[
  'https://aiet.edu.in/wp-content/uploads/2020/06/image041.jpg',
];

final List<String> networkNames5 =[
  'https://aiet.edu.in/wp-content/uploads/2020/07/DSC_5187-600x400.jpg',
];
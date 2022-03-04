import 'package:flutter/material.dart';
import '../slider/MenuWidget.dart';
import '../slider/SliderDrawer.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(slivers: [
            SliverAppBar(
              backgroundColor: Colors.blue,
              floating: true,
              //pinned: true,
              title: Text('ContactUsPage'),
              leading: MenuWidget(),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(
                          'https://image3.mouthshut.com/images/imagesp/925888452s.jpg'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        size: 32,
                        color: Colors.red,
                      ),
                      title: Text('admin@aiet.edu.in',
                          style: TextStyle(
                            fontSize: 21,
                            //color: Colors.black
                          )),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        size: 32,
                        color: Colors.red,
                      ),
                      title: Text('+91 760-012-2122',
                          style: TextStyle(
                            fontSize: 21,
                            //        color: Colors.black
                          )),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        size: 32,
                        color: Colors.red,
                      ),
                      title: Text('+91 968-725-5050',
                          style: TextStyle(
                            fontSize: 21,
                            //        color: Colors.black
                          )),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.location_city,
                        size: 32,
                        color: Colors.red,
                      ),
                      title: Text(
                          'SNME Campus, Near S.P. Ring Road Circle, GJ SH 68, Nava Naroda,, Enasan, Gujarat 382330',
                          style: TextStyle(
                            fontSize: 21,
                            //        color: Colors.black
                          )),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.web_asset,
                        size: 32,
                        color: Colors.red,
                      ),
                      title: Text('www.aiet.edu.in',
                          style: TextStyle(
                            fontSize: 21,
                            //       color: Colors.black
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
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
}

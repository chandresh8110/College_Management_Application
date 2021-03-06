// ignore_for_file: camel_case_types, non_constant_identifier_names, unnecessary_null_comparison

import 'dart:convert';
import 'package:final_app/HOD_Side/HOD_Slider/HMenuWidget.dart';
import 'package:final_app/HOD_Side/HOD_Slider/HSliderDrawer.dart';
import 'package:final_app/slider/SliderDrawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../General Side/theme_helper.dart';
import 'HOD_Details_Page.dart';

class HOD_Setting_page extends StatefulWidget {
  const HOD_Setting_page({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  _HOD_Setting_pageState createState() => _HOD_Setting_pageState();
}

class _HOD_Setting_pageState extends State<HOD_Setting_page> {
  Future<List> getData() async {
    var url = "http://103.141.241.97/test/fac_profile.php";
    final response = await http.post(Uri.parse(url), body: {
      "username": widget.username,
    });
    print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        // leading: HMenuWidget(
        //   username: widget.username,
        // ),
        // backgroundColor: Colors.blue,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.lightGreenAccent,
                Colors.lightBlueAccent,
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            if (kDebugMode) {
              if (kDebugMode) {
                print(snapshot.error);
              }
            }
          }
          if (snapshot.hasData) {
            return ItemList(list: snapshot.data!);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({Key? key, required this.list}) : super(key: key);

  final List list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: ThemeHelper().buttonBoxDecoration(context),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: list == null ? 0 : list.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "${list[i]['fname']}" +
                              "  ${list[i]['mname']}" +
                              "  ${list[i]['lname']}",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                      subtitle: Text(list[i]['id']),
                      leading: Container(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage:AssetImage(
                                  "images/Logo_.png"
                              ),
                              foregroundImage: NetworkImage(
                                "http://103.141.241.97/test/uploads/Faculty/${list[i]["pic"]}",
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              HOD_Details(list: list, index: i),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: ThemeHelper().buttonBoxDecoration(context),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SliderDrawer(),
                      ),
                    );
                  },
                  child: Text("Logout"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

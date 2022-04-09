// ignore_for_file: camel_case_types, non_constant_identifier_names, unnecessary_null_comparison

import 'dart:convert';
import 'package:final_app/Profile/Attendance_Student_sub.dart';
import 'package:final_app/Student%20Side/Student_Slider/SMenuWidget.dart';
import 'package:final_app/slider/SliderDrawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../General Side/theme_helper.dart';
import 'Details_Page.dart';

class Profile_page extends StatefulWidget {
  const Profile_page({Key? key, required this.username}) : super(key: key);
  final String username;

  @override
  _Profile_pageState createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  Future<List> getData() async {
    var url = "http://103.141.241.97/test/app_profile.php";
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
        title: Text('Profile'),
        // leading: SMenuWidget(
        //   username: widget.username,
        // ),
        // backgroundColor: Colors.blue,
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
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            if (kDebugMode) {
              print(snapshot.error);
            }
          }
          if (snapshot.hasData) {
            return ItemList(
              list: snapshot.data!,
              username: widget.username,
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  const ItemList({Key? key, required this.list, required this.username})
      : super(key: key);

  final List list;
  final String username;

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  bool loading = true;
  List? Atten;

  Future getoverall() async {
    var url = "http://103.141.241.97/test/count3.php";
    final response = await http.post(Uri.parse(url), body: {
      "id": widget.username,
    });
    var jsonData = json.decode(response.body);
    setState(() {
      Atten = jsonData;
      loading = false;
    });
    if (kDebugMode) {
      print(Atten);
    }
  }

  @override
  void initState() {
    getoverall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: ThemeHelper().buttonBoxDecoration(context),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.list == null ? 0 : widget.list.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "${widget.list[i]['stu_fname']}" +
                                    "  ${widget.list[i]['stu_mname']}" +
                                    "  ${widget.list[i]['stu_lname']}",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            subtitle: Text(widget.list[i]['stu_id']),
                            leading: Container(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage:AssetImage(
                                        "images/Logo_.png"
                                    ),
                                    foregroundImage: NetworkImage(
                                      "http://103.141.241.97/test/uploads/Student/${widget.list[i]["stu_pic"]}",
                                    ),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ],
                              ),
                            ),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Details(list: widget.list, index: i),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: Atten!.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                            child: ListTile(
                              title: Text(
                                " Your overall Attendance:- " +
                                    "${Atten![i]["percentage"]}" +
                                    "%",
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Attendence_Student_subject_wise(
                                    username: widget.username,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
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

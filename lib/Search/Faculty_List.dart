import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Faculty_List extends StatefulWidget {
  const Faculty_List({Key? key, required this.branch}) : super(key: key);

  final String branch;

  @override
  State<Faculty_List> createState() => _Faculty_ListState();
}

class _Faculty_ListState extends State<Faculty_List> {
  Timer? timer;
  bool loading = true;
  List? facultyList;
  String table = 'mix';

  Future fetchAllfaculty() async {
    var url = 'http://103.141.241.97/test/view_faculty.php';
    var response = await http.post(Uri.parse(url), body: {
      "tb": table,
      "branch": widget.branch,
    });
    if (response.statusCode == 200) {
      setState(() {
        facultyList = jsonDecode(response.body);
        loading = false;
      });
      if (kDebugMode) {
        print(facultyList);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAllfaculty();
    timer = Timer.periodic(
        const Duration(seconds: 55), (Timer t) => fetchAllfaculty());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.branch),
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
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: facultyList!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "${facultyList![index]['fname']}" +
                          "  ${facultyList![index]['mname']}" +
                          "  ${facultyList![index]['lname']}",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  subtitle: Text(facultyList![index]['id']),
                  leading: const Icon(
                    Icons.account_circle_outlined,
                    size: 30,
                  ),
                );
              },
            ),
    );
  }
}

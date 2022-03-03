// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'Material_View.dart';

class Material_list extends StatefulWidget {
  const Material_list(
      {Key? key,
      required this.branch,
      required this.sem,
      required this.course,
      required this.year})
      : super(key: key);

  final String branch;
  final String sem;
  final String course;
  final String year;

  @override
  _Material_listState createState() => _Material_listState();
}

class _Material_listState extends State<Material_list> {
  Timer? timer;
  bool loading = true;
  List? pdfList;

  Future fetchAllPdf() async {
    var url = 'http://103.141.241.97/test/material_fetch.php';
    var response = await http.post(Uri.parse(url), body: {
      "branch": widget.branch,
      "sem": widget.sem,
      "course_name": widget.course,
      "year" : widget.year,
    });
    if (response.statusCode == 200) {
      setState(() {
        pdfList = jsonDecode(response.body);
        loading = false;
      });
      if (kDebugMode) {
        print(pdfList);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAllPdf();
    timer =
        Timer.periodic(const Duration(seconds: 55), (Timer t) => fetchAllPdf());
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
        title: Text(widget.course),
        backgroundColor: Colors.blue,
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: pdfList!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Material_View(
                            name: pdfList![index]["mat_name"],
                            title: pdfList![index]["course_name"],
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.picture_as_pdf),
                    label: Text("Chapter No:-  " + pdfList![index]["ch_no"]),
                  ),
                );
              },
            ),
    );
  }
}

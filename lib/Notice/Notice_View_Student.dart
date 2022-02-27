// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:final_app/Student%20Side/Student_Slider/SMenuWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'pdfview.dart';

class Notice_View_Student extends StatefulWidget {
  const Notice_View_Student({Key? key}) : super(key: key);

  @override
  _Notice_View_StudentState createState() => _Notice_View_StudentState();
}

class _Notice_View_StudentState extends State<Notice_View_Student> {
  Timer? timer;
  bool loading = true;
  List? pdfList;

  Future fetchAllPdf() async {
    final response =
        await http.get(Uri.parse("http://103.141.241.97/test/Fetch.php"));
    if (response.statusCode == 200) {
      setState(() {
        pdfList = jsonDecode(response.body);
        loading = false;
      });
      if (kDebugMode) {
        if (kDebugMode) {
          print(pdfList);
        }
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
          title: const Text('Notice'),
          backgroundColor: Colors.blue,
          leading: SMenuWidget(),
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
                      icon: const Icon(Icons.picture_as_pdf),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PdfViewPage(
                              name: pdfList![index]["file"],
                              title: pdfList![index]["notice_sub"],
                            ),
                          ),
                        );
                      },
                      // icon: const Icon(Icons.picture_as_pdf),
                      label: Text(pdfList![index]["notice_sub"]),
                    ),
                  );
                }));
  }
}

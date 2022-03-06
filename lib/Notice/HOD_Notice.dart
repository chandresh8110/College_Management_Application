// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:final_app/HOD_Side/HOD_Slider/HMenuWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../General Side/theme_helper.dart';
import 'Add_Notice.dart';
import 'pdfview.dart';

class HOD_Notice extends StatefulWidget {
  const HOD_Notice({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  _HOD_NoticeState createState() => _HOD_NoticeState();
}

class _HOD_NoticeState extends State<HOD_Notice> {
  Timer? timer;
  bool loading = true;
  List? pdfList;

  Future fetchAllPdf() async {
    final response =
        await http.get(Uri.parse("http://103.141.241.97/test/notice_fetch.php"));
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
          // backgroundColor: Colors.blue,
          leading: HMenuWidget(
            username: widget.username,
          ),
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
                itemCount: pdfList!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: TextButton.icon(
                      icon: const Icon(Icons.picture_as_pdf),
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                      ),
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
                }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: () {
            setState(() {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Add_Notice()),
              );
            });
          },
        ));
  }
}

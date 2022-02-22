import 'dart:async';
import 'dart:convert';
import 'package:final_app/Developer_Team/Developer_slider/DMenuWidget.dart';
import 'package:final_app/Notice/pdfview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Add_Notice.dart';

class Developer_Notice extends StatefulWidget {
  const Developer_Notice({Key? key}) : super(key: key);

  @override
  _Developer_NoticeState createState() => _Developer_NoticeState();
}

class _Developer_NoticeState extends State<Developer_Notice> {
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
    timer =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => fetchAllPdf());
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
          leading: DMenuWidget(),
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

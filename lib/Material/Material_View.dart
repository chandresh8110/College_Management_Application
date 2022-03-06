// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Material_View extends StatefulWidget {
  const Material_View(
      {Key? key,
      required this.name,
      required this.title})
      : super(key: key);

  final String name;
  final String title;

  @override
  _Material_ViewState createState() => _Material_ViewState();
}

class _Material_ViewState extends State<Material_View> {
  PdfViewerController? _pdfViewerController;
  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
      body: SfPdfViewer.network(
          "http://103.141.241.97/test/uploads/Material/" + widget.name,
          controller: _pdfViewerController),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewPage extends StatefulWidget {
  const PdfViewPage({Key? key, required this.name, required this.title})
      : super(key: key);

  final String name;
  final String title;

  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  // bool loading = true ;
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
      ),
      body: SfPdfViewer.network(
          "http://103.141.241.97/test/uploads/Notice/" + widget.name,
          controller: _pdfViewerController),
    );
  }
}

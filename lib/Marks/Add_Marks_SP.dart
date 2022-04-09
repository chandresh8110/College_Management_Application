// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Add_Marks_SP extends StatefulWidget {
  const Add_Marks_SP(
      {Key? key,
      required this.branch,
      required this.sem,
      required this.exam_id,
      required this.username,
      required this.cid})
      : super(key: key);

  final String branch;
  final String sem;
  final String exam_id;
  final String username;
  final String cid;

  @override
  State<Add_Marks_SP> createState() => _Add_Marks_SPState();
}

class _Add_Marks_SPState extends State<Add_Marks_SP> {
  TextEditingController markscontroller = TextEditingController();
  List? ListEr;
  String? stu_Er;
  bool loading = true;
  // String? table = "add_marks";

  Future<List> fetchErno() async {
    var url = "http://103.141.241.97/test/stufetch.php";
    final response = await http.post(Uri.parse(url), body: {
      'sem': widget.sem,
      'branch': widget.branch,
      'cid': widget.cid,
      'exam_code': widget.exam_id,
    });
    if (kDebugMode) {
      print(response.body);
    }
    var jsonData = json.decode(response.body);
    setState(() {
      ListEr = jsonData;
      loading = false;
    });
    return json.decode(response.body);
  }

  var ser = [];
  List<Map<String, dynamic>>? _values;

  String? Ma;
  var Marks = [];
  String? _result;
  @override
  void initState() {
    fetchErno();
    _values = [];
    _result = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add_Marks"),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: ListEr?.length,
                    itemBuilder: (context, index) {
                      return _row(context, index);
                    },
                  ),
                ),
                // Flexible(child: Text(_result!)),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Expanded(
                          child: AlertDialog(
                            // backgroundColor: Colors.red,
                            title: Text('Alert!!!'),
                            content: Text(
                              "Are you sure about submitting the marks?"
                              "\n\n\n Once you submit marks you can't be change it",
                              style: TextStyle(
                                // color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            actions: [
                              TextButton(
                                // textColor: Colors.white,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('CANCEL'),
                              ),
                              TextButton(
                                // textColor: Colors.white,
                                onPressed: () {
                                  sendMarks();
                                  Navigator.of(context).pop();
                                },
                                child: Text('Yes, Sure'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                ),
              ],
            ),
    );
  }

  _row(context, index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text(ListEr![index]["stu_id"]),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (val) {
                _onUpdate(index, val);
              },
            ),
          ),
        ],
      ),
    );
  }

  _onUpdate(int index, String val) async {
    int foundKey = -1;
    for (var map in _values!) {
      if (map.containsKey("id")) {
        if (map["id"] == index) {
          foundKey = index;
          break;
        }
      }
    }
    if (-1 != foundKey) {
      _values!.removeWhere((map) {
        return map["id"] == foundKey;
      });
    }
    Map<String, dynamic> json = {
      "id": index,
      "value": val,
    };
    _values!.add(json);
    setState(() {
      _result = _prettyPrint(_values);
    });
  }

  String _prettyPrint(jsonObject) {
    var encoder = JsonEncoder.withIndent(" ");
    return encoder.convert(jsonObject);
  }

  void sendMarks() async {
    var url = "http://103.141.241.97/test/addexammarks.php";
    final response = await http.post(Uri.parse(url), body: {
      // 'tb': table,
      'branch': widget.branch,
      'sem': widget.sem,
      'givenby': widget.username,
      'cid': widget.cid,
      'exam_code': widget.exam_id,
      'marks': _result.toString(),
    });
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }
    }
  }
}

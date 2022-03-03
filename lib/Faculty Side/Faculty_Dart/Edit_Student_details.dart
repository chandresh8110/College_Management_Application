// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Edit_Student_details extends StatefulWidget {
  const Edit_Student_details(
      {Key? key, required this.list, required this.index})
      : super(key: key);

  final List list;
  final int index;

  @override
  _Edit_Student_detailsState createState() => _Edit_Student_detailsState();
}

class _Edit_Student_detailsState extends State<Edit_Student_details> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController? idcontroller;
  TextEditingController? fnamecontroller;
  TextEditingController? mnamecontroller;
  TextEditingController? lnamecontroller;
  TextEditingController? joiningcontroller;
  TextEditingController? mnocontroller;
  TextEditingController? emailcontroller;
  TextEditingController? addresscontroller;
  TextEditingController? gnamecontroller;
  TextEditingController? gmnocontroller;
  TextEditingController? gemailcontroller;

  String? semValue;
  String? selectedBranch;
  String? labValue;
  List? BranchitemList;
  String? status;

  Future getdata() async {
    var url = "http://103.141.241.97/test/getbranch.php";
    final response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    setState(() {
      BranchitemList = jsonData;
    });
    if (kDebugMode) {
      print(BranchitemList);
    }
  }

  void editData() async {
    var response = await http.post(Uri.parse("http://103.141.241.97/test/editstu.php"), body: {
      "id": idcontroller!.text,
      "fname": fnamecontroller!.text,
      "mname": mnamecontroller!.text,
      "lname": lnamecontroller!.text,
      "jyear": joiningcontroller!.text,
      "sem": semValue,
      "branch": selectedBranch,
      "lab": labValue,
      "mno": mnocontroller!.text,
      "email": emailcontroller!.text,
      "addr": addresscontroller!.text,
      "gname": gnamecontroller!.text,
      "gmno": gmnocontroller!.text,
      "gemail": gemailcontroller!.text,
      "status": status,
      // "editby": widget.username,
    });
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    }
  }

  @override
  void initState() {
    idcontroller =
        TextEditingController(text: widget.list[widget.index]['stu_id']);
    fnamecontroller =
        TextEditingController(text: widget.list[widget.index]['stu_fname']);
    mnamecontroller =
        TextEditingController(text: widget.list[widget.index]['stu_mname']);
    lnamecontroller =
        TextEditingController(text: widget.list[widget.index]['stu_lname']);
    joiningcontroller =
        TextEditingController(text: widget.list[widget.index]['stu_jyear']);
    selectedBranch = (widget.list[widget.index]['branch']);
    semValue = (widget.list[widget.index]['sem']);
    labValue = (widget.list[widget.index]['stu_lab']);
    mnocontroller =
        TextEditingController(text: widget.list[widget.index]['stu_mno']);
    emailcontroller =
        TextEditingController(text: widget.list[widget.index]['stu_email']);
    addresscontroller =
        TextEditingController(text: widget.list[widget.index]['stu_addr']);
    gnamecontroller =
        TextEditingController(text: widget.list[widget.index]['stu_gname']);
    gmnocontroller =
        TextEditingController(text: widget.list[widget.index]['stu_gmno']);
    gemailcontroller =
        TextEditingController(text: widget.list[widget.index]['stu_gemail']);
    status = (widget.list[widget.index]['status']);
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit" +
            " ${widget.list[widget.index]['stu_fname']}'s" +
            " Detail"),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.number,
                    readOnly: true,
                    enabled: false,
                    controller: idcontroller,
                    decoration: InputDecoration(
                      labelText: "Enrollment No:",
                      hintText: "Enter Student's Enrollment No.",
                    ),
                    validator: (value) {
                      if (value!.isNotEmpty && value.length > 12) {
                        return 'Big as compare to enrollment No';
                      } else if (value.length < 12 && value.isNotEmpty) {
                        return 'Short as compare to Enrollment No';
                      } else if (value.isEmpty) {
                        return 'required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: fnamecontroller,
                    decoration: InputDecoration(
                      labelText: "First Name:",
                      hintText: "Enter Student's First Name",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required';
                      } else if (value.isNotEmpty) {
                        return null;
                      }
                    },
                  ),
                  Container(
                    child: TextFormField(
                      controller: mnamecontroller,
                      decoration: InputDecoration(
                        labelText: "Middle Name:",
                        hintText: "Enter Student's Middle Name",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'required';
                        } else if (value.isNotEmpty) {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      controller: lnamecontroller,
                      decoration: InputDecoration(
                        labelText: "Last Name:",
                        hintText: "Enter Student's Last Name",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'required';
                        } else if (value.isNotEmpty) {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: joiningcontroller,
                      decoration: InputDecoration(
                        labelText: "Joining Year:",
                        hintText: "Ex: 2018-19",
                      ),
                      validator: (value) {
                        if (value!.isNotEmpty && value.length > 4) {
                          return 'Just 4 Number';
                        } else if (value.length < 4 && value.isNotEmpty) {
                          return 'Just 4 Number';
                        } else if (value.isEmpty) {
                          return 'required';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text('Select Branch'),
                      value: selectedBranch,
                      items: BranchitemList?.map((branch) {
                        return DropdownMenuItem(
                            value: branch['branch_name'],
                            child: Text(branch['branch_name']));
                      }).toList(),
                      onChanged: (branch) {
                        setState(
                          () {
                            selectedBranch = branch.toString();
                            print(selectedBranch);
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    child: DropdownButton<String>(
                      hint: Text('Select Sem'),
                      value: semValue,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      // style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 0.1,
                        // color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          semValue = newValue!;
                        });
                      },
                      items: <String>['1', '2', '3', '4', '5', '6', '7', '8']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    child: DropdownButton<String>(
                      hint: Text('Select Batch'),
                      value: labValue,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      // style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 0.1,
                        // color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          labValue = newValue!;
                        });
                      },
                      items: <String>['A', 'B', 'C']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: mnocontroller,
                      decoration: InputDecoration(
                        labelText: "Mobile No:",
                        hintText: "Enter Student's Mobile No.",
                      ),
                      validator: (value) {
                        if (value!.isNotEmpty && value.length > 10) {
                          return 'Bigger then Mobile No';
                        } else if (value.length < 10 && value.isNotEmpty) {
                          return 'Shorter then Mobile No';
                        } else if (value.isEmpty) {
                          return 'required';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ), //text input for class
                  Container(
                    child: TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        labelText: "Email Id:",
                        hintText: "Enter Student's Email Id",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'required';
                        } else if (value.isNotEmpty) {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      // expands: true,
                      // minLines: 2,
                      maxLines: 4,
                      controller: addresscontroller,
                      decoration: InputDecoration(
                        labelText: "Address:",
                        hintText: "Enter Student's Address",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'required';
                        } else if (value.isNotEmpty) {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      controller: gnamecontroller,
                      decoration: InputDecoration(
                        labelText: "Parents/Guardian's Name:",
                        hintText: "Enter Parents/Guardian's Name",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'required';
                        } else if (value.isNotEmpty) {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: gmnocontroller,
                      decoration: InputDecoration(
                        labelText: "Parents/Guardian's Mobile No:",
                        hintText: "Enter Parents/Guardian's Mobile No",
                      ),
                      validator: (value) {
                        if (value!.isNotEmpty && value.length > 10) {
                          return 'Bigger then Mobile No';
                        } else if (value.length < 10 && value.isNotEmpty) {
                          return 'Shorter then Mobile No';
                        } else if (value.isEmpty) {
                          return 'required';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      controller: gemailcontroller,
                      decoration: InputDecoration(
                        labelText: "Parents/Guardian's Email Id:",
                        hintText: "Enter Parents/Guardian's Email Id",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'required';
                        } else if (value.isNotEmpty) {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    child: DropdownButton<String>(
                      hint: Text('Select Status'),
                      value: status,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      // style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 0.1,
                        // color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          status = newValue!;
                        });
                      },
                      items: <String>["Pursuing", "Drop", "Left"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      editData();
                      Navigator.of(context).pop();
                    },
                    child: Text('Edit Data'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

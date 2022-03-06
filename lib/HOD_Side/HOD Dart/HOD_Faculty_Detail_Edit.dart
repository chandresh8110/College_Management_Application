// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class Edit_Faculty_details extends StatefulWidget {
  const Edit_Faculty_details(
      {Key? key, required this.list, required this.index, required this.username})
      : super(key: key);

  final List list;
  final int index;
  final String username;

  @override
  _Edit_Faculty_detailsState createState() => _Edit_Faculty_detailsState();
}

class _Edit_Faculty_detailsState extends State<Edit_Faculty_details> {
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

  // String? semValue;
  String? selectedBranch;
  // String? labValue;
  List? BranchitemList;
  String? status;
  String? role;

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
    var response = await http
        .post(Uri.parse("http://103.141.241.97/test/editfac.php"), body: {
      "id": idcontroller!.text,
      "fname": fnamecontroller!.text,
      "mname": mnamecontroller!.text,
      "lname": lnamecontroller!.text,
      "jyear": joiningcontroller!.text,
      // "sem": semValue,
      "branch": selectedBranch,
      // "lab": labValue,
      "mno": mnocontroller!.text,
      "email": emailcontroller!.text,
      "addr": addresscontroller!.text,
      "gname": gnamecontroller!.text,
      "gmno": gmnocontroller!.text,
      "gemail": gemailcontroller!.text,
      "status": status,
      "role" : role,
      "editby": widget.username,
    });
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    }
  }

  @override
  void initState() {
    idcontroller =
        TextEditingController(text: widget.list[widget.index]['id']);
    fnamecontroller =
        TextEditingController(text: widget.list[widget.index]['fname']);
    mnamecontroller =
        TextEditingController(text: widget.list[widget.index]['mname']);
    lnamecontroller =
        TextEditingController(text: widget.list[widget.index]['lname']);
    joiningcontroller =
        TextEditingController(text: widget.list[widget.index]['jyear']);
    selectedBranch = (widget.list[widget.index]['branch']);
    // semValue = (widget.list[widget.index]['sem']);
    // labValue = (widget.list[widget.index]['stu_lab']);
    mnocontroller =
        TextEditingController(text: widget.list[widget.index]['mno']);
    emailcontroller =
        TextEditingController(text: widget.list[widget.index]['email']);
    addresscontroller =
        TextEditingController(text: widget.list[widget.index]['addr']);
    gnamecontroller =
        TextEditingController(text: widget.list[widget.index]['gname']);
    gmnocontroller =
        TextEditingController(text: widget.list[widget.index]['gmno']);
    gemailcontroller =
        TextEditingController(text: widget.list[widget.index]['gemail']);
    status = (widget.list[widget.index]['status']);
    role = (widget.list[widget.index]['role']);
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text("Edit" +
            " ${widget.list[widget.index]['fname']}'s" +
            " Detail"),
        // backgroundColor: Colors.blue,
        gradient: LinearGradient(
          colors: [
            Colors.lime,
            Colors.cyan,
          ],
        ),
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
                      labelText: "Faculty id:",
                      hintText: "Enter Faculty's Id",
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
                      hintText: "Enter Faculty's First Name",
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
                        hintText: "Enter Faculty's Middle Name",
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
                        hintText: "Enter Faculty's Last Name",
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
                        if (value!.isNotEmpty && value.length > 7) {
                          return 'Just 7 Number';
                        } else if (value.length < 7 && value.isNotEmpty) {
                          return 'Just 7 Number';
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
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: mnocontroller,
                      decoration: InputDecoration(
                        labelText: "Mobile No:",
                        hintText: "Enter Faculty's Mobile No.",
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
                        hintText: "Enter Faculty's Email Id",
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
                      maxLines: 4,
                      controller: addresscontroller,
                      decoration: InputDecoration(
                        labelText: "Address:",
                        hintText: "Enter Faculty's Address",
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
                      items: <String>["Active","Inactive"]
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
                      hint: Text('Select Role'),
                      value: role,
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
                          role = newValue!;
                        });
                      },
                      items: <String>["HOD","Faculty"]
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

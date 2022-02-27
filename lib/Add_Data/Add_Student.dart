// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Add_Student extends StatefulWidget {
  const Add_Student({Key? key}) : super(key: key);

  @override
  _Add_StudentState createState() => _Add_StudentState();
}

class _Add_StudentState extends State<Add_Student> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? _image;
  final _picker = ImagePicker();
  TextEditingController idcontroller = TextEditingController();
  TextEditingController fnamecontroller = TextEditingController();
  TextEditingController mnamecontroller = TextEditingController();
  TextEditingController lnamecontroller = TextEditingController();
  TextEditingController joiningcontroller = TextEditingController();
  TextEditingController mnocontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController gnamecontroller = TextEditingController();
  TextEditingController gmnocontroller = TextEditingController();
  TextEditingController gemailcontroller = TextEditingController();
  // TextEditingController semcontroller = TextEditingController();
  // TextEditingController branchcontroller = TextEditingController();
  // TextEditingController batchcontroller = TextEditingController();

  String? semValue;
  String? selectedBranch;
  String? labValue;
  List? BranchitemList;
  String? status;
  String? password;

  late bool error, sending, success;
  late String msg;
  String table = 'student';

  Future choiceImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  Future pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

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

  @override
  void initState() {
    getdata();
    error = false;
    sending = false;
    success = false;
    msg = "";
    super.initState();
  }

  Future sendData() async {
    final phpurl = Uri.parse("http://103.141.241.97/test/insert_data.php");
    var request = http.MultipartRequest('POST', phpurl);
    request.fields['table'] = table;
    request.fields['sem'] = semValue!;
    request.fields['branch'] = selectedBranch!;
    request.fields['lab'] = labValue!;
    request.fields['id'] = idcontroller.text;
    request.fields['fname'] = fnamecontroller.text;
    request.fields['mname'] = mnamecontroller.text;
    request.fields['lname'] = lnamecontroller.text;
    request.fields['jyear'] = joiningcontroller.text;
    request.fields['mno'] = mnocontroller.text;
    request.fields['email'] = emailcontroller.text;
    request.fields['addr'] = addresscontroller.text;
    request.fields['gname'] = gnamecontroller.text;
    request.fields['gmno'] = gmnocontroller.text;
    request.fields['gemail'] = gemailcontroller.text;
    request.fields['status'] = status!;
    request.fields['password'] = password!;
    var pic = await http.MultipartFile.fromPath("image", _image!.path);
    request.files.add(pic);
    var res = await request.send();

    var resp = await http.Response.fromStream(res);
    if (res.statusCode == 200) {
      //   print("okay");
      // }else{
      //   print("Ghare ja");
      // }
      print(resp.body); //print raw response on console
      var data = json.decode(resp.body); //decoding json to array
      if (data["error"]) {
        setState(() {
          //refresh the UI when error is recieved from server
          sending = false;
          error = true;
          msg = (data["message"]); //error message from server
        });
      } else {
        idcontroller.text = '';
        fnamecontroller.text = '';
        mnamecontroller.text = '';
        lnamecontroller.text = '';
        mnocontroller.text = '';
        emailcontroller.text = '';
        addresscontroller.text = '';
        gnamecontroller.text = '';
        gmnocontroller.text = '';
        fnamecontroller.text = '';
        gemailcontroller.text = '';
        joiningcontroller.text = '';

        //after write success, make fields empty

        setState(() {
          sending = false;
          success = true; //mark success and refresh UI with setState
        });
      }
    } else {
      //there is error
      setState(() {
        error = true;
        msg = "Error during sendign data.";
        sending = false;
        //mark error and refresh UI with setState
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title:Text("Add_Student"),
      //     backgroundColor:Colors.blue,
      // ), //appbar

      body: SingleChildScrollView(
        //enable scrolling, when keyboard appears,
        // hight becomes small, so prevent overflow
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    error ? msg : "Enter Student's Information",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  //if there is error then sho msg, other wise show text message
                ),
                Container(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
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
                ),
                Container(
                  child: TextFormField(
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
                      hintText: "Ex: 2018",
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
                      hint: const Text('Select Branch'),
                      value: selectedBranch,
                      items: BranchitemList?.map((branch) {
                        return DropdownMenuItem(
                            value: branch['branch_name'],
                            child: Text(branch['branch_name']));
                      }).toList(),
                      onChanged: (branch) {
                        setState(() {
                          selectedBranch = branch.toString();
                          print(selectedBranch);
                        });
                      }),
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
                    items: <String>[
                      'Sem 1',
                      'Sem 2',
                      'Sem 3',
                      'Sem 4',
                      'Sem 5',
                      'Sem 6',
                      'Sem 7',
                      'Sem 8'
                    ].map<DropdownMenuItem<String>>((String value) {
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
                    items: <String>['A Batch', 'B Batch', 'C Batch']
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
                    hint: Text('Select Password'),
                    value: password,
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
                        password = newValue!;
                      });
                    },
                    items: <String>['123456789', '123456789']
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      child: Text(
                        "Image:",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Container(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.orangeAccent),
                          onPressed: () {
                            choiceImage();
                          },
                          icon: Icon(Icons.image),
                          label: Text('GALLERY'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.orangeAccent),
                          onPressed: () {
                            pickImage();
                          },
                          icon: Icon(Icons.camera_alt_outlined),
                          label: Text('CAMERA'),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  // height: 200,
                  child: _image == null
                      ? Text('No image Selected')
                      : Image.file(_image!),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {
                            //if button is pressed, setstate sending = true, so that we can show "sending..."
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            setState(() {
                              sending = true;
                            });
                            sendData();
                          },
                          child: Text(
                            sending ? "Sending..." : "SEND DATA",
                            //if sending == true then show "Sending" else show "SEND DATA";
                          ),
                          color: Colors.blue,
                          colorBrightness: Brightness.dark,
                          //background of button is darker color, so set brightness to dark
                        ))),
                Container(
                  child: Text(success ? "Write Success" : "send data"),
                  //is there is success then show "Write Success" else show "send data"
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

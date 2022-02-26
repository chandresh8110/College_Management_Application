import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Add_Notice extends StatefulWidget {
  const Add_Notice({Key? key}) : super(key: key);

  @override
  _Add_NoticeState createState() => _Add_NoticeState();
}

class _Add_NoticeState extends State<Add_Notice> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File? selectedfile;
  Response? response;
  String? progress;
  Dio dio = new Dio();

  TextEditingController idcontroller = TextEditingController();
  TextEditingController titlecontroller = TextEditingController();

  String semValue = 'All';
  String branchValue = 'General';

  String table = 'notice';

  selectFile() async {
    // selectedfile = await FilePicker.getFile(
    //   type: FileType.custom,
    //   allowedExtensions: ['jpg', 'pdf', 'mp4'],
    //   //allowed extension to choose
    // );

    //for file_pocker plugin version 2 or 2+

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      //allowed extension to choose
    );

    if (result != null) {
      //if there is selected file
      selectedfile = File(result.files.single.path!);
    }

    setState(() {}); //update the UI so that file name is shown
  }

  uploadFile() async {
    String uploadurl = "http://103.141.241.97/test/notice_upload.php";
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP

    FormData formdata = FormData.fromMap({
      "table": table,
      "sem": semValue,
      "branch": branchValue,
      "id": idcontroller.text,
      "title": titlecontroller.text,
      "file": await MultipartFile.fromFile(selectedfile!.path,
          filename: basename(selectedfile!.path)
          //show only filename from path
          ),
    });

    response = await dio.post(
      uploadurl,
      data: formdata,
      onSendProgress: (int sent, int total) {
        String percentage = (sent / total * 100).toStringAsFixed(2);
        setState(() {
          progress = "$sent" +
              " Bytes of " "$total Bytes - " +
              percentage +
              " % uploaded";
          //update the progress
        });
      },
    );

    if (response!.statusCode == 200) {
      print(response.toString());
      //print response from server
    } else {
      print("Error during connection to server.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add_Notice'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(40),
              child: Column(
                children: <Widget>[
                  Container(
                    child: TextFormField(
                      controller: idcontroller,
                      decoration: const InputDecoration(
                        labelText: "Notice Id",
                        hintText: "Notice Id",
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
                      controller: titlecontroller,
                      decoration: const InputDecoration(
                        labelText: "Title / Subject",
                        hintText: "About Notice",
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
                  Row(
                    children: [
                      Container(
                        child: const Text(
                          'Select Sem:        ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        child: DropdownButton<String>(
                          value: semValue,
                          // isExpanded: true,
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
                            'All',
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
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: const Text(
                          'Select Branch:        ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        child: DropdownButton<String>(
                          value: branchValue,
                          // isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          // style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 0.1,
                            // color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              branchValue = newValue!;
                            });
                          },
                          items: <String>[
                            'General',
                            'Computer',
                            'It',
                            'Electrical',
                            'Mechanical',
                            'Civil',
                            'AI_DS'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    //show file name here
                    child: progress == null
                        ? const Text("Progress: 0%")
                        : Text(
                            basename("Progress: $progress"),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                          ),
                    //show progress status here
                  ),

                  Container(
                    margin: const EdgeInsets.all(10),
                    //show file name here
                    child: selectedfile == null
                        ? const Text("Choose File")
                        : Text(basename(selectedfile!.path)),
                    //basename is from path package, to get filename from path
                    //check if file is selected, if yes then show file name
                  ),

                  Container(
                      child: RaisedButton.icon(
                        onPressed: () {
                          selectFile();
                        },
                        icon: const Icon(Icons.folder_open),
                        label: const Text("CHOOSE FILE"),
                        color: Colors.redAccent,
                        colorBrightness: Brightness.dark,
                  )),

                  //if selectedfile is null then show empty container
                  //if file is selected then show upload button
                  selectedfile == null
                      ? Container()
                      : Container(
                          child: RaisedButton.icon(
                          onPressed: () {
                            uploadFile();
                            Navigator.of(context).pop();
                          },
                            icon: const Icon(Icons.folder_open),
                            label: const Text("UPLOAD FILE"),
                            color: Colors.redAccent,
                            colorBrightness: Brightness.dark,
                        ),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}

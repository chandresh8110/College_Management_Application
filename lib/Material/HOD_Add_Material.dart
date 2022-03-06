import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HOD_Add_Material extends StatefulWidget {
  const HOD_Add_Material({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  _HOD_Add_MaterialState createState() => _HOD_Add_MaterialState();
}

class _HOD_Add_MaterialState extends State<HOD_Add_Material> {
  String? selectedBranch;
  List? BranchitemList;
  String? selectedSem;
  String? selectedyear;
  List? YearList;
  Timer? timer;

  Future getyear() async {
    var url = "http://103.141.241.97/test/getyear.php";
    final response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    setState(() {
      YearList = jsonData;
    });
    if (kDebugMode) {
      print(YearList);
    }
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
    getyear();
    getdata();
    super.initState();
  }

  Future<List> post() async {
    var url = "http://103.141.241.97/test/getcourse.php";
    final response = await http.post(Uri.parse(url), body: {
      'sem': selectedSem,
      'branch': selectedBranch,
      'year': selectedyear,
    });
    if (kDebugMode) {
      print(response.body);
    }
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Material'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButton(
                  isExpanded: true,
                  hint: const Text('Select Year'),
                  value: selectedyear,
                  items: YearList?.map((course) {
                    return DropdownMenuItem(
                        value: course['year'], child: Text(course['year']));
                  }).toList(),
                  onChanged: (year) {
                    setState(() {
                      selectedyear = year.toString();
                      print(selectedyear);
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButton(
                isExpanded: true,
                hint: const Text('Select Sem'),
                // Initial Value
                value: selectedSem,

                // Down Arrow Icon
                icon: const Icon(Icons.arrow_drop_down),

                // Array list of items
                items: <String>[
                  '1',
                  '2',
                  '3',
                  '4',
                  '5',
                  '6',
                  '7',
                  '8',
                ].map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (sem) {
                  setState(() {
                    selectedSem = sem.toString();
                    if (kDebugMode) {
                      print(selectedSem);
                    }
                  });
                },
              ),
            ),
            FutureBuilder<List>(
                future: post(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    if (kDebugMode) {
                      print(snapshot.error);
                    }
                  }
                  if (snapshot.hasData) {
                    return CourseList(
                      list: snapshot.data!,
                      sem: '$selectedSem',
                      branch: '$selectedBranch',
                      year: '$selectedyear',
                      username: widget.username,
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
    );
  }
}

// class CourseList extends StatefulWidget {
//   const CourseList(
//       {Key? key,
//       required this.list,
//       required this.sem,
//       required this.branch,
//       required this.year,
//       required this.username})
//       : super(key: key);
//
//   final List list;
//   final String sem;
//   final String branch;
//   final String year;
//   final String username;
//
//   @override
//   State<CourseList> createState() => _CourseListState();
// }
//
// class _CourseListState extends State<CourseList> {
//   TextEditingController chapternocontroller = TextEditingController();
//
//   File? selectedfile;
//   Response? response;
//   String? progress;
//   Dio dio = new Dio();
//   String? selectedCourse;
//   Timer? timer;
//
//   selectFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//       //allowed extension to choose
//     );
//
//     if (result != null) {
//       //if there is selected file
//       selectedfile = File(result.files.single.path!);
//     }
//
//     setState(() {}); //update the UI so that file name is shown
//   }
//
//   uploadFile() async {
//     String uploadurl = "http://103.141.241.97/test/mat_upload.php";
//     FormData formdata = FormData.fromMap({
//       "sem": widget.sem,
//       "branch": widget.branch,
//       "c_id": selectedCourse,
//       "c_no": chapternocontroller.text,
//       'uploadedby': widget.username,
//       "file": await MultipartFile.fromFile(selectedfile!.path,
//           filename: selectedfile!.path
//           //show only filename from path
//           ),
//     });
//
//     response = await dio.post(
//       uploadurl,
//       data: formdata,
//       onSendProgress: (int sent, int total) {
//         String percentage = (sent / total * 100).toStringAsFixed(2);
//         setState(() {
//           progress = "$sent" +
//               " Bytes of " "$total Bytes - " +
//               percentage +
//               " % uploaded";
//           //update the progress
//         });
//       },
//     );
//
//     if (response!.statusCode == 200) {
//       print(response.toString());
//       //print response from server
//     } else {
//       print("Error during connection to server.");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: DropdownButton(
//               menuMaxHeight: 5000,
//               isExpanded: true,
//               hint: const Text('Select Course'),
//               value: selectedCourse,
//               items: widget.list.map((course) {
//                 return DropdownMenuItem(
//                     value: course['cname'],
//                     child: Text(course['cname']));
//               }).toList(),
//               onChanged: (course) {
//                 setState(() {
//                   selectedCourse = course.toString();
//                   if (kDebugMode) {
//                     print(selectedCourse);
//                   }
//                 });
//               },
//             ),
//           ),
//           Container(
//             child: TextFormField(
//               controller: chapternocontroller,
//               decoration: const InputDecoration(
//                 labelText: "Chapter No.",
//                 hintText: "Short Form like :- ch-1 , ch-2",
//               ),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'required';
//                 } else if (value.isNotEmpty) {
//                   return null;
//                 }
//               },
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.all(10),
//             //show file name here
//             child: progress == null
//                 ? const Text("Progress: 0%")
//                 : Text(
//                     "Progress: $progress",
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(fontSize: 18),
//                   ),
//             //show progress status here
//           ),
//
//           Container(
//             margin: const EdgeInsets.all(10),
//             //show file name here
//             child: selectedfile == null
//                 ? const Text("Choose File")
//                 : Text(selectedfile!.path),
//             //basename is from path package, to get filename from path
//             //check if file is selected, if yes then show file name
//           ),
//
//           Container(
//               child: ElevatedButton.icon(
//             style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
//             onPressed: () {
//               selectFile();
//             },
//             icon: const Icon(Icons.folder_open),
//             label: const Text("CHOOSE FILE"),
//           )),
//
//           //if selectedfile is null then show empty container
//           //if file is selected then show upload button
//           selectedfile == null
//               ? Container()
//               : Container(
//                   child: ElevatedButton.icon(
//                     style:
//                         ElevatedButton.styleFrom(primary: Colors.orangeAccent),
//                     onPressed: () {
//                       uploadFile();
//                       // Navigator.of(context).pop();
//                     },
//                     icon: const Icon(Icons.folder_open),
//                     label: const Text("UPLOAD FILE"),
//                   ),
//                 ),
//         ],
//       ),
//     );
//   }
// }
class CourseList extends StatefulWidget {
  const CourseList(
      {Key? key,
        required this.list,
        required this.sem,
        required this.branch,
        required this.year,
        required this.username})
      : super(key: key);

  final List list;
  final String sem;
  final String branch;
  final String year;
  final String username;

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  TextEditingController chapternocontroller = TextEditingController();

  File? selectedfile;
  Response? response;
  String? progress;
  Dio dio = new Dio();
  String? selectedCourse;
  Timer? timer;

  selectFile() async {
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
    String uploadurl = "http://103.141.241.97/test/mat_upload.php";
    FormData formdata = FormData.fromMap({
      "year": widget.year,
      "sem": widget.sem,
      "branch": widget.branch,
      "c_name": selectedCourse,
      "c_no": chapternocontroller.text,
      'uploadedby': widget.username,
      "file": await MultipartFile.fromFile(selectedfile!.path,
          filename: selectedfile!.path
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButton(
              menuMaxHeight: 5000,
              isExpanded: true,
              hint: const Text('Select Course'),
              value: selectedCourse,
              items: widget.list.map((course) {
                return DropdownMenuItem(
                    value: course['cname'], child: Text(course['cname']));
              }).toList(),
              onChanged: (course) {
                setState(() {
                  selectedCourse = course.toString();
                  if (kDebugMode) {
                    print(selectedCourse);
                  }
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: TextFormField(
                controller: chapternocontroller,
                decoration: const InputDecoration(
                  labelText: "Chapter No.",
                  hintText: "Short Form like :- ch-1 , ch-2",
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
          ),
          Container(
            margin: const EdgeInsets.all(10),
            //show file name here
            child: progress == null
                ? const Text("Progress: 0%")
                : Text(
              "Progress: $progress",
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
                : Text(selectedfile!.path),
            //basename is from path package, to get filename from path
            //check if file is selected, if yes then show file name
          ),

          Container(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
                onPressed: () {
                  selectFile();
                },
                icon: const Icon(Icons.folder_open),
                label: const Text("CHOOSE FILE"),
              )),

          //if selectedfile is null then show empty container
          //if file is selected then show upload button
          selectedfile == null
              ? Container()
              : Container(
            child: ElevatedButton.icon(
              style:
              ElevatedButton.styleFrom(primary: Colors.orangeAccent),
              onPressed: () {
                uploadFile();
                Navigator.of(context).pop();
                // setState(() {
                //   Navigator.pop(context);
                // });
              },
              icon: const Icon(Icons.folder_open),
              label: const Text("UPLOAD FILE"),
            ),
          ),
        ],
      ),
    );
  }
}

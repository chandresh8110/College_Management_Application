import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../General Side/theme_helper.dart';

class Add_Course extends StatefulWidget {
  const Add_Course({Key? key}) : super(key: key);

  @override
  _Add_CourseState createState() => _Add_CourseState();
}

class _Add_CourseState extends State<Add_Course> {
  TextEditingController idcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController yearcontroller = TextEditingController();

  String? semValue;
  String? selectedBranch;
  List? BranchitemList;

  late bool error, sending, success;
  late String msg;
  String table = 'course';

  String phpurl = "http://103.141.241.97/test/insert_data.php";

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

  Future<void> sendData() async {
    var res = await http.post(
      Uri.parse(phpurl),
      body: {
        "table": table,
        "sem": semValue,
        "branch": selectedBranch,
        "id": idcontroller.text,
        "name": namecontroller.text,
        "year": yearcontroller.text,
      },
    ); //sending post request with header data

    if (res.statusCode == 200) {
      print(res.body); //print raw response on console
      var data = json.decode(res.body); //decoding json to array
      if (data["error"]) {
        setState(() {
          //refresh the UI when error is recieved from server
          sending = false;
          error = true;
          msg = (data["message"]); //error message from server
        });
      } else {
        idcontroller.text = '';
        namecontroller.text = '';
        yearcontroller.text = '';
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
      body: SingleChildScrollView(
        //enable scrolling, when keyboard appears,
        // hight becomes small, so prevent overflow
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  error ? msg : "Enter Course Information",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                //if there is error then sho msg, other wise show text message
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    hint: const Text('Select Branch'),
                    value: selectedBranch,
                    items: BranchitemList?.map((branch) {
                      return DropdownMenuItem(
                        value: branch['branch_name'],
                        child: Text(
                          branch['branch_name'],
                        ),
                      );
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: TextField(
                    controller: idcontroller,
                    decoration: ThemeHelper()
                        .textInputDecoration("Course Id", "Enter Course Id"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: TextField(
                    controller: namecontroller,
                    decoration: ThemeHelper().textInputDecoration(
                        "Course's Name", "Enter Course's Name"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: TextField(
                    controller: yearcontroller,
                    keyboardType: TextInputType.number,
                    decoration: ThemeHelper()
                        .textInputDecoration("Year", "Ex.: 2018-19"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                  ),
                  child: DropdownButton<String>(
                    hint: Text('Select Sem'),
                    value: semValue,
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    elevation: 16,
                    // style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 0.1,
                      // color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          semValue = newValue!;
                        },
                      );
                    },
                    items: <String>['1', '2', '3', '4', '5', '6', '7', '8']
                        .map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
              Container(
                decoration: ThemeHelper().buttonBoxDecoration(context),
                margin: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ThemeHelper().buttonStyle(),
                    onPressed: () {
                      //if button is pressed, setstate sending = true, so that we can show "sending..."
                      setState(
                        () {
                          sending = true;
                        },
                      );
                      sendData();
                    },
                    child: Text(
                      sending ? "Sending..." : "SEND DATA",
                      //if sending == true then show "Sending" else show "SEND DATA";
                    ),
                    //background of button is darker color, so set brightness to dark
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(success ? "Write Success" : "send data"),
                  //is there is success then show "Write Success" else show "send data"
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

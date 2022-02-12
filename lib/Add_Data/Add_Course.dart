import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;





class Add_Course extends StatefulWidget {
  const Add_Course({Key? key}) : super(key: key);

  @override
  _Add_CourseState createState() => _Add_CourseState();
}

class _Add_CourseState extends State<Add_Course> {

  TextEditingController idcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();

  String semValue = 'Sem 1';
  String branchValue = 'Computer';



  late bool error, sending, success;
  late String msg;
  String table = 'course';

  String phpurl = "http://103.141.241.97/test/insert_data.php";

  @override
  void initState() {
    error = false;
    sending = false;
    success = false;
    msg = "";
    super.initState();
  }

  Future<void> sendData() async {

    var res = await http.post(Uri.parse(phpurl), body: {
      "table": table,
      "sem": semValue,
      "branch": branchValue,
      "id": idcontroller.text,
      "name": namecontroller.text,
    }); //sending post request with header data

    if (res.statusCode == 200) {
      print(res.body); //print raw response on console
      var data = json.decode(res.body); //decoding json to array
      if(data ["error"]){
        setState(() { //refresh the UI when error is recieved from server
          sending = false;
          error = true;
          msg = (data ["message"]); //error message from server
        });
      }else{

        idcontroller.text = '';
        namecontroller.text = '';
        //after write success, make fields empty

        setState(() {
          sending = false;
          success = true; //mark success and refresh UI with setState
        });
      }

    }else{
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
      body: SingleChildScrollView( //enable scrolling, when keyboard appears,
        // hight becomes small, so prevent overflow
          child:Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    child:Text(error?msg:"Enter Course Information",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    //if there is error then sho msg, other wise show text message
                  ),
                  Container(
                      child: TextField(
                        controller: idcontroller,
                        decoration: InputDecoration(
                          labelText:"Course Id:",
                          hintText:"Enter Course id.",
                        ),
                      )
                  ),
                  Container(
                      child: TextField(
                        controller: namecontroller,
                        decoration: InputDecoration(
                          labelText:"Course Name:",
                          hintText:"Enter Course Name",
                        ),
                      )
                  ),
                 Container(
                    child: DropdownButton<String>(
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
                        setState(() {
                          semValue = newValue!;
                        });
                      },
                      items: <String>['Sem 1','Sem 2','Sem 3','Sem 4','Sem 5','Sem 6','Sem 7','Sem 8']
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
                      value: branchValue,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down_circle_outlined),
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
                      items: <String>['Computer','It','Electrical','Mechanical','Civil','AI_DS']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top:20),
                      child:SizedBox(
                          width: double.infinity,
                          child:MaterialButton(
                            onPressed:(){ //if button is pressed, setstate sending = true, so that we can show "sending..."
                              setState(() {
                                sending = true;
                              });
                              sendData();
                            },
                            child: Text(
                              sending?"Sending...":"SEND DATA",
                              //if sending == true then show "Sending" else show "SEND DATA";
                            ),
                            color: Colors.blue,
                            colorBrightness: Brightness.dark,
                            //background of button is darker color, so set brightness to dark
                          )
                      )
                  ),
                  Container(
                    child:Text(success?"Write Success":"send data"),
                    //is there is success then show "Write Success" else show "send data"
                  ),
                ],)
          )
      ),
    );
  }
}
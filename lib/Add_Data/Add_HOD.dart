import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;





class Add_HOD extends StatefulWidget {
  const Add_HOD({Key? key}) : super(key: key);

  @override
  _Add_HODState createState() => _Add_HODState();
}

class _Add_HODState extends State<Add_HOD> {

  TextEditingController idcontroller = TextEditingController();
  TextEditingController fnamecontroller = TextEditingController();
  TextEditingController mnamecontroller = TextEditingController();
  TextEditingController lnamecontroller = TextEditingController();
  TextEditingController mnocontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController gnamecontroller = TextEditingController();
  TextEditingController gmnocontroller = TextEditingController();
  TextEditingController gemailcontroller = TextEditingController();


  String branchValue = 'Computer';

  late bool error, sending, success;
  late String msg;
  String table = 'hod';

  String phpurl = "http://192.168.2.46/clg/extralogintesting.php";

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
      "branch": branchValue,
      "id": idcontroller.text,
      "fname": fnamecontroller.text,
      "mname": mnamecontroller.text,
      "lname": lnamecontroller.text,
      "mno": mnocontroller.text,
      "email": emailcontroller.text,
      "addr": addresscontroller.text,
      "gname":gnamecontroller.text,
      "gmno":gmnocontroller.text,
      "gemail":gemailcontroller.text,
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
        fnamecontroller.text = '';
        mnamecontroller.text = '';
        lnamecontroller.text = '';
        mnocontroller.text = '';
        emailcontroller.text = '';
        addresscontroller.text = '';
        gnamecontroller.text = '';
        gmnocontroller.text = '';
        gemailcontroller.text = '';


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
      // appBar: AppBar(
      //     title:Text("Add_HOD"),
      //     backgroundColor:Colors.blue
      // ), //appbar

      body: SingleChildScrollView( //enable scrolling, when keyboard appears,
        // hight becomes small, so prevent overflow
          child:Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    child:Text(error?msg:"Enter HOD's Information",
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
                          labelText:"Enrollment No:",
                          hintText:"Enter Student's Enrollment No.",
                        ),
                      )
                  ),
                  Container(
                      child: TextField(
                        controller: fnamecontroller,
                        decoration: InputDecoration(
                          labelText:"First Name:",
                          hintText:"Enter HOD's First Name",
                        ),
                      )
                  ),
                  Container(
                      child: TextField(
                        controller: mnamecontroller,
                        decoration: InputDecoration(
                          labelText:"Middle Name:",
                          hintText:"Enter HOD's Middle Name",
                        ),
                      )
                  ),
                  Container(
                      child: TextField(
                        controller: lnamecontroller,
                        decoration: InputDecoration(
                          labelText:"Last Name:",
                          hintText:"Enter HOD's Last Name",
                        ),
                      )
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
                      child: TextField(
                        controller: mnocontroller,
                        decoration: InputDecoration(
                          labelText:"Mobile No:",
                          hintText:"Enter HOD's Mobile No.",
                        ),
                      )
                  ), //text input for class
                  Container(
                      child: TextField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          labelText:"Email Id:",
                          hintText:"Enter HOD's Email Id",
                        ),
                      )
                  ),
                  Container(
                      child: TextField(
                        // expands: true,
                        // minLines: 2,
                        // maxLines: 4,
                        controller: addresscontroller,
                        decoration: InputDecoration(
                          labelText:"Address:",
                          hintText:"Enter HOD's Address",
                        ),
                      )
                  ),
                  Container(
                      child: TextField(
                        controller: gnamecontroller,
                        decoration: InputDecoration(
                          labelText:"Parents/Guardian's Name:",
                          hintText:"Enter Parents/Guardian's Name",
                        ),
                      )
                  ),
                  Container(
                      child: TextField(
                        controller: gmnocontroller,
                        decoration: InputDecoration(
                          labelText:"Parents/Guardian's Mobile No:",
                          hintText:"Enter Parents/Guardian's Mobile No",
                        ),
                      )
                  ),
                  Container(
                      child: TextField(
                        controller: gemailcontroller,
                        decoration: InputDecoration(
                          labelText:"Parents/Guardian's Email Id:",
                          hintText:"Enter Parents/Guardian's Email Id",
                        ),
                      )
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
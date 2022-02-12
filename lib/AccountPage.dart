import 'dart:convert';
import 'package:final_app/Student%20Side/Student_Slider/SSliderDrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Developer_Team/Developer_slider/DSliderDrawer.dart';
import 'Faculty Side/Faculty Slider/FSliderDrawer.dart';
import 'HOD_Side/HOD_Slider/HSliderDrawer.dart';
import 'slider/MenuWidget.dart';




class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  String dropdownValue = 'Student';
  String? table;

  Future login() async{
    var url= "http://103.141.241.97/test/test.php";
    var response = await http.post(Uri.parse(url),body:{
      "table" : dropdownValue,
      "username" : usernamecontroller.text,
      "password" : passwordcontroller.text,
    });

    var data = json.decode(response.body);
    if (data == "Student") {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SSliderDrawer(),),);
    } else if(data == "Faculty") {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FSliderDrawer(),),);
    } else if(data == "HOD"){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HSliderDrawer(),),);
    }else if(data == "Developer"){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DSliderDrawer(),),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blue,
              title: Text('LoginPage'),
              leading: MenuWidget(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage('https://image3.mouthshut.com/images/imagesp/925888452s.jpg'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 10,right: 20,left: 60,bottom: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blueGrey,width: 2),
                  ),
                  child:DropdownButton<String>(
                    value: dropdownValue,
                    hint: Text("Select Role"),
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    elevation: 20,
                    isExpanded: true,
                    // style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 0,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Student', 'Faculty', 'HOD', 'Developer']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 0,right: 10, left: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextField(
                    // obscureText: true,
                    controller: usernamecontroller,
                    decoration: const InputDecoration(
                      border: const OutlineInputBorder(),
                      icon: Icon(Icons.account_circle_outlined),
                      labelText: 'Enrollment No./ Faculty No.',
                      hintText: 'Enrollment No./ Faculty No.',
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 0,right: 10,left: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordcontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.vpn_key_outlined),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10,right: 20,left: 20),
                child: Container(
                  color: Colors.blue,
                  child: MaterialButton(
                      child: const Text('Login'),
                      onPressed: (){
                        login();
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;






class Notice_View_Student extends StatefulWidget {
  const Notice_View_Student({Key? key}) : super(key: key);

  @override
  _Notice_View_StudentState createState() => _Notice_View_StudentState();
}

class _Notice_View_StudentState extends State<Notice_View_Student> {

  Future<List> getData() async{
    var url = "http://192.168.2.42/clg/getdata.php";
    await Future.delayed(Duration(milliseconds: 1));
    final response=await http.get(Uri.parse(url));
    return json.decode(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (
            Text('Notice')
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot){
            if(snapshot.hasError) {
              if (kDebugMode) {
                if (kDebugMode) {
                  print(snapshot.error);
                }
              }
            }
            if (snapshot.hasData) {
              return ItemList(list: snapshot.data!);
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget{
  const ItemList({Key? key, required this.list}) : super(key: key);

  final List list;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list==null?0: list.length,
      itemBuilder: (context,i){
        return ListTile(
          title: Text(list[i]['id']),
          subtitle: Text(list[i]['name']),
          leading: const Icon(Icons.message),
          onTap:(){}
          );
      },
    );
  }
}
import 'package:flutter/material.dart';


class Details extends StatefulWidget {
  const Details({Key? key, required this.list, required this.index}) : super(key: key);

  final List list;
  final int index;

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['stu_fname']}"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          Text("Enrollment No: " + "${widget.list[widget.index]['stu_id']}",
            style: const TextStyle(fontSize: 20.0),
          ),
          Text("Name : " +
              " ${widget.list[widget.index]['stu_fname']}" +
              "  ${widget.list[widget.index]['stu_mname']}" +
              "  ${widget.list[widget.index]['stu_lname']}",
            style: const TextStyle(fontSize: 20.0),
          ),
          Text("Joining Year : " + "${widget.list[widget.index]['stu_jyear']}",
            style: const TextStyle(fontSize: 20.0),
          ),
          Text("${widget.list[widget.index]['sem']}",
            style: const TextStyle(fontSize: 20.0),
          ),
          Text("Branch : " + "${widget.list[widget.index]['branch']}",
            style: const TextStyle(fontSize: 20.0),
          ),
          Text("Lab : " + "${widget.list[widget.index]['stu_lab']}",
            style: const TextStyle(fontSize: 20.0),
          ),
          Text("Mobile No : " + "${widget.list[widget.index]['stu_mno']}",
            style: const TextStyle(fontSize: 20.0),
          ),
          Text("Email : " + "${widget.list[widget.index]['stu_email']}",
            style: const TextStyle(fontSize: 20.0),
          ),
          Text("Address : " + "${widget.list[widget.index]['stu_addr']}",
            style: const TextStyle(fontSize: 20.0),
          ),
          Text("Parent's/Guardian's Name : " + "${widget.list[widget.index]['stu_gname']}",
            style: const TextStyle(fontSize: 20.0),
          ),
          Text("Parent's/Guardian's Mobile No : " + "${widget.list[widget.index]['stu_gmno']}",
            style: const TextStyle(fontSize: 20.0),
          ),
          Text("Parent's/Guardian's Email : " + "${widget.list[widget.index]['stu_gemail']}",
            style: const TextStyle(fontSize: 20.0),
          ),
          Text("Password : " + "${widget.list[widget.index]['pwd']}",
            style: const TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}


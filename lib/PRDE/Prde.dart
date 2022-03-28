// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:final_app/slider/MenuWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'PrdeList.dart';

class Prde extends StatefulWidget {
  const Prde({Key? key}) : super(key: key);

  @override
  State<Prde> createState() => _PrdeState();
}

class _PrdeState extends State<Prde> {
  String? selectedBranch;
  List? BranchitemList;
  String? selectedSem;

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

  Future<List> post() async {
    var url = "http://103.141.241.97/test/stufetch.php";
    final response = await http.post(Uri.parse(url), body: {
      'sem': selectedSem,
      'branch': selectedBranch,
    });
    if (kDebugMode) {
      print(response.body);
    }
    return json.decode(response.body);
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Promote/Demote"),
        leading: MenuWidget(),
      ),
      body: Column(
        children: [
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
              items: <String>['1', '2', '3', '4', '5', '6', '7', '8']
                  .map((String items) {
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
          ElevatedButton(
            onPressed: () {
              post();
              Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                      builder: (context) => PrdeList(
                        sem: '$selectedSem',
                        branch: '$selectedBranch',
                      ),
                    ),
                  )
                  .then((value) => setState(() {
                        selectedBranch = value;
                        selectedSem = value;
                      }));
            },
            child: const Text("OKAY"),
          )
        ],
      ),
    );
  }
}

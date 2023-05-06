import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';


class SecondTab extends StatefulWidget {
  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  String data;
  getData() async {
    data = await DefaultAssetBundle.of(context).loadString("assets/data.json");
  }

  @override
  Widget build(BuildContext context) {
    var json = jsonDecode(data);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          JsonTable(json),
          SizedBox(
            height: 16,
          ),
          Text("json_table"),
        ],
      ),
    );
  }
}

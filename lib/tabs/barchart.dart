import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class Month{
  String month;
  double revenue;
  final charts.Color color;
  Month({this.month,this.revenue,this.color});
}



class barchart extends StatefulWidget {

  @override
  State<barchart> createState() => _barchartState();
}

class _barchartState extends State<barchart> {
  List<Month> collection=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    String data =
    await DefaultAssetBundle.of(context).loadString("assets/data1.json");

    var jsonData = json.decode(data);

    jsonData.forEach((item) {
      item.forEach((key, value) {
        collection.add(Month(
          month: value['month'],
          revenue: value['rev'],
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Month, String>> series = [
      charts.Series(
        id: "financial",
        data: collection,
        domainFn: (Month series, _) => series.month,
        measureFn: (Month series, _) => series.revenue,
      ),
    ];

    return Padding(
      padding: EdgeInsets.fromLTRB(10, 300, 10, 300),
      child: Container(
          height:200 ,
          child: Center(
            child: charts.BarChart(
              series,
              animate: true,

            ),
          ),
          ), //Container
    );
  }
}


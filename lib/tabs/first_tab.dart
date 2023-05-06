import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Month{
  String month;
  double profit;
  Month({this.month,this.profit});
}

class FirstTab extends StatefulWidget {
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {

  final dataMap = <String, double>{};
  List<Month> monthList = List();

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
        monthList.add(Month(
            month: value['month'],
            profit: value['prof']
        ));
      });
    });
    monthList.forEach((item){
      // print(item.month);
      // print(item.revenue);
      dataMap.putIfAbsent(item.month, () => item.profit);
    });
  }

    @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 250,
            child: PieChart(
              dataMap: dataMap,
              showLegends: true,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text("pie_chart"),
        ],
      ),
    );
  }
}


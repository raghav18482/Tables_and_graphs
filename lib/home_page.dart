import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_tabs/tabs/barchart.dart';
import 'package:flutter_responsive_tabs/tabs/first_tab.dart';
import 'package:flutter_responsive_tabs/tabs/second_tab.dart';
import 'package:flutter_responsive_tabs/tabs/table.dart';
import 'package:flutter_responsive_tabs/tabs/third_tab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive Tabs"),
      ),
      body: isTab(context)
          ? Container(
        margin: EdgeInsets.only(left: 4, right: 4, top: 8),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Tab(
                      child: Text("Monthly Profit",
                        style: TextStyle(color: Colors.black),
                      )
                    ),
                  ),
                  Expanded(child: FirstTab()),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Tab(
                      child: Text("Table",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Expanded(child: table()),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Tab(
                      child: Text("Monthly Revenue",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  barchart(),
                ],
              ),
            ),
          ],
        ),
      )
          : DefaultTabController(
            length: 3,
                child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    clipBehavior: Clip.antiAlias,
                    elevation: 2,
                    child: TabBar(
                      isScrollable: true,
                      indicatorWeight: 4,
                      tabs: [
                        Tab(
                          child: Text("Monthly Profit",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Tab(
                          child: Text("Table",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Tab(
                          child: Text("Monthly Revenue",
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                 Expanded(
                  child: TabBarView(
                    children: [
                      FirstTab(),
                      table(),
                      barchart(),
                    ],
                  ),
                ),
              ],
          ),
        ),

    );
  }

  bool isTab(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.width;
    return shortestSide >= 600;
  }
}
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class table extends StatefulWidget {
  const table({Key key}) : super(key: key);

  @override
  State<table> createState() => _tableState();
}

class _tableState extends State<table> {

  List<List<dynamic>> csvData;
  Future<List<List<dynamic>>> processCsv() async {
    var result = await DefaultAssetBundle.of(context).loadString(
      "assets/mycsv.csv",
    );
    return const CsvToListConverter().convert(result, eol: "\n");
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(

        children: [
          SizedBox(
            height: 200,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: csvData == null
                  ? const CircularProgressIndicator()
                  : DataTable(
                    columns: csvData[0].map(
                      (item) => DataColumn(
                        label: Text(
                          item.toString(),
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 15)
                        ),
                      ),
                    ).toList(),
                    rows: csvData.map(
                          (csvrow) => DataRow(
                        cells: csvrow.map(
                              (csvItem) => DataCell(
                            Text(
                              csvItem.toString(),
                            ),
                          ),
                        ).toList(),
                      ),
                    ).toList(),
              ),
          ),
              SizedBox(
                height: 200,
              ),
              ElevatedButton(
                child: const Text(
                  'Raised Button',
                ),
                onPressed: () async {
                  csvData = await processCsv();
                  setState(() {});
                },
          ),
        ],
      ),
    );

  }
}

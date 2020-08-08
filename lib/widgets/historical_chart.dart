import 'package:bezier_chart/bezier_chart.dart';
import 'package:ethereumscan/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';
import 'dart:math';


class ChartSample extends StatefulWidget {
  @override
  _ChartSampleState createState() => _ChartSampleState();
}

class _ChartSampleState extends State<ChartSample> {
  Random random = new Random();
  bool _initState = true;
  List<DataPoint<dynamic>> _data = [
  ];
  @override
  void didChangeDependencies() {
    if(_initState == true){
      Provider.of<MainProvider>(context).fetchEthPriceHistory().then((value) {
        var newData = Provider.of<MainProvider>(context, listen: false).ethPriceHistory;
        newData.forEach((element) {
          print(element['weightedAverage']);
          _data.add(DataPoint<DateTime>(value: element['weightedAverage'], xAxis:new DateTime.fromMillisecondsSinceEpoch(element['date'] * 1000) ));
        });

      });
      setState(() {
        _initState = false;
      });
    }
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
//    final PriceData = Provider.of<MainProvider>(context).fetchEthPriceHistory();


    final fromDate = DateTime(2016, 11, 22);
    final toDate = DateTime.now();

//    final date1 = DateTime.now().subtract(Duration(days: 2));
//    final date2 = DateTime.now().subtract(Duration(days: 3));
//
//    final date3 = DateTime.now().subtract(Duration(days: 35));
//    final date4 = DateTime.now().subtract(Duration(days: 36));
//
//    final date5 = DateTime.now().subtract(Duration(days: 65));
//    final date6 = DateTime.now().subtract(Duration(days: 64));

    return Center(
      child: Container(
        color: Colors.orange,
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        child: BezierChart(
          bezierChartScale: BezierChartScale.HOURLY,
          fromDate: fromDate,
          toDate: toDate,
          selectedDate: toDate,

          series: [
            BezierLine(
              label: "Duty",
              onMissingValue: (dateTime) {
                if (dateTime.month.isEven) {
                  return 0.0;
                }
                return 0.0;
              },
              data: _data
            ),
          ],
          config: BezierChartConfig(
            bubbleIndicatorColor: Colors.orange,
            displayYAxis: true,
            pinchZoom: true,
            displayLinesXAxis: true,
            startYAxisFromNonZeroValue: false,
            verticalIndicatorStrokeWidth: 5.0,
            verticalIndicatorColor: Colors.black26,
            showVerticalIndicator: true,
            verticalIndicatorFixedPosition: false,
            backgroundColor: Colors.blue[900],
            footerHeight: 30.0,
          ),
        ),
      ),
    );
  }
}

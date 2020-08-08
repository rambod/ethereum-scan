import 'package:ethereumscan/provider/main_provider.dart';
import 'package:ethereumscan/widgets/PriceChart.dart';
import 'package:ethereumscan/widgets/card_gas.dart';
import 'package:ethereumscan/widgets/current_price.dart';
import 'package:ethereumscan/widgets/historical_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        CurrentPrice(),
        Expanded(
          child: GridView(
            padding: EdgeInsets.all(10),
            children: [
              CardGass(),
            ],
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width * .5,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
          ),
        )
      ],
    ));
  }
}

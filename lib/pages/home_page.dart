import 'package:ethereumscan/provider/main_provider.dart';
import 'package:ethereumscan/widgets/card_block_number.dart';
import 'package:ethereumscan/widgets/card_gas.dart';
import 'package:ethereumscan/widgets/current_price.dart';
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
          mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CurrentPrice(),
        Container(
          height: MediaQuery.of(context).size.height * .5,
          child: GridView(
            padding: EdgeInsets.all(10),
            children: [
              CardGass(),
              CardBlockNumber(),

            ],
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width * .5,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
          ),
        )
      ],
    ));
  }
}

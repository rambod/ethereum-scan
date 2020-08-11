import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                        'Ethereum scan developed base on etherscan.io API\'s. This is not Official application of Ethereum organization and developed by individual.'),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                height: MediaQuery.of(context).size.height * .2,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Icon(FontAwesomeIcons.handHolding)),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Text('ETH Donation Address')),
                      ],
                    ),
                    SelectableText(
                        '0x80c2fD14fdb2189296f4dDc56F889F3ee69E373d'),
                    RaisedButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(
                            text:
                                '0x80c2fD14fdb2189296f4dDc56F889F3ee69E373d'));
                        Scaffold.of(context).showSnackBar(SnackBar(

                          content: Text('Copied! Thanks'),
                        ));
                      },
                      child: Icon(FontAwesomeIcons.copy),
                    )
                  ],
                ),
              ),
            ),
            Container(
                height: 100,
                child: FlareActor(
                  'assets/anim/loading.in.blue.ethereum.flr',
                  animation: 'Loading',
                )),
          ],
        ));
  }
}

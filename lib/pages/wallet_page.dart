import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
            height: 150,
            child: FlareActor(
              'assets/anim/loading.in.blue.ethereum.flr',
              animation: 'Loading',
            )));
  }
}

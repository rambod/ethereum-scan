import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';


class BlocksPage extends StatefulWidget {
  @override
  _BlocksPageState createState() => _BlocksPageState();
}

class _BlocksPageState extends State<BlocksPage> {
  @override
  Widget build(BuildContext context) {
    return Container(height: 150,
      child: FlareActor('assets/anim/loading.in.blue.ethereum.flr',animation: 'Loading',)
    );
  }
}

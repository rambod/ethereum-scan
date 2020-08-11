import 'package:ethereumscan/provider/main_provider.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flare_dart/actor.dart';

class CardBlockNumber extends StatefulWidget {
  @override
  _CardBlockNumberState createState() => _CardBlockNumberState();
}

class _CardBlockNumberState extends State<CardBlockNumber> {
  bool _initState = false;
  bool _dataLoaded = false;

  @override
  void didChangeDependencies() {
    if(!_initState){
      Provider.of<MainProvider>(context).fetchCurrentBlockNumber().then((value){
        setState(() {
          _initState = true;
          _dataLoaded = true;
        });
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<MainProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child:Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(FontAwesomeIcons.cubes,size: 70,color: Colors.indigo[900],),
            _dataLoaded ? (dataProvider.currentBlockNumber != null ? Text(int.parse(dataProvider.currentBlockNumber['result']).toString(),style: TextStyle(fontSize: 18),) : Container(height: 60,child: FlareActor('assets/anim/loading.in.blue.ethereum.flr',animation: 'Loading',))) : Container(height: 70,child: FlareActor('assets/anim/loading.in.blue.ethereum.flr',animation: 'Loading',),)

          ],
        ),
      )
    );
  }
}

import 'package:ethereumscan/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class CardGass extends StatefulWidget {
  @override
  _CardGassState createState() => _CardGassState();
}

class _CardGassState extends State<CardGass> {
  bool _initState = false;

  @override
  void didChangeDependencies() {
    if(_initState ==false){
      Provider.of<MainProvider>(context).fetchGasPrice();
      setState(() {
        _initState = true;
      });
    }
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<MainProvider>(context);

    return Container(
      height: MediaQuery.of(context).size.height * .2,
      width: MediaQuery.of(context).size.width * .4,
      child: Card(
        elevation: 10,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(child: Icon(FontAwesomeIcons.gasPump,color: Colors.blue[900],size: 40,),),
              dataProvider.gasPrice != null ? Text((int.parse(dataProvider.gasPrice['result']) / 1000000000).toString().substring(0,4) + ' Gw ' + ((int.parse(dataProvider.gasPrice['result']) / 1000000000 / 1000000000) *20000 * double.parse(dataProvider.currentPrice['ethusd'])).toString().substring(0,4)+ "\$",style: TextStyle(fontSize: 25),) : CircularProgressIndicator(backgroundColor: Colors.blue[900],),
            ],
          ),
        ),
      ),
    );
  }
}

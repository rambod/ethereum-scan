import 'package:ethereumscan/provider/main_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flare_flutter/flare_actor.dart';


class CardGass extends StatefulWidget {
  @override
  _CardGassState createState() => _CardGassState();
}

class _CardGassState extends State<CardGass> {
  bool _initState = false;
  final fiveSeconds = const Duration(seconds: 5);
  String _gasPriceText = ' ' ;

  @override
  void didChangeDependencies() {
    if(_initState ==false){
      Provider.of<MainProvider>(context).fetchGasPrice().then((value){
        setState(() {
          _gasPriceText = (int.parse(Provider.of<MainProvider>(context, listen: false).gasPrice['result']) / 1000000000).toString().substring(0,4) + ' Gw ' + ((int.parse(  Provider.of<MainProvider>(context, listen: false).gasPrice['result']) / 1000000000 / 1000000000) *20000 * double.parse(  Provider.of<MainProvider>(context, listen: false).currentPrice['ethusd'])).toString().substring(0,4)+ "\$";
          _initState = true;
        });
      });

    }
    super.didChangeDependencies();
  }




  @override
  Widget build(BuildContext context) {
//    final dataProvider = Provider.of<MainProvider>(context);

    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(child: Icon(FontAwesomeIcons.gasPump,color: Colors.indigo[900],size: 70,),),
              _initState ? Text(_gasPriceText, style: TextStyle(fontSize: 18),) :  Container(height: 70,child: FlareActor('assets/anim/loading.in.blue.ethereum.flr',animation: 'Loading',)),
            ],
          ),
        ),
      ),
    );
  }
}

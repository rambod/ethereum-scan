import 'package:ethereumscan/provider/main_provider.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CurrentPrice extends StatefulWidget {
  @override
  _CurrentPriceState createState() => _CurrentPriceState();
}

class _CurrentPriceState extends State<CurrentPrice> {
  bool _boot = false;
  bool _currentPriceFetched = false;
  double _fontSize = 25;
  double _iconSize = 35;

  @override
  void didChangeDependencies() {
    if (_boot == false) {
      Provider.of<MainProvider>(context).fetchCurrentPrice().then((value) {
        setState(() {
          _currentPriceFetched = true;
          _boot = true;
        });
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);

    void fetchData(){
      mainProvider.fetchCurrentPrice();
    }

    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height * .2,
        width: double.infinity,
        child: !_currentPriceFetched
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
                children: [
          Container(height: 60,width:60,child: FlareActor('assets/anim/loading.in.blue.ethereum.flr',animation: 'Loading',))
                ],
              )
            : mainProvider.currentPrice != null ? Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Last Update '+ DateTime.fromMillisecondsSinceEpoch(int.parse(mainProvider.currentPrice['ethusd_timestamp']) * 1000).toString().substring(0,19))
                    ],
                  ),
                ),
                Card(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('ETHER PRICE'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.dollarSign,size: _iconSize,color: Colors.green[900]),
                            Container(margin:EdgeInsets.all(10),child: Text(mainProvider.currentPrice['ethusd'].toString(),style: TextStyle(fontSize: _fontSize))),
                            Icon(FontAwesomeIcons.ethereum,color: Colors.indigo[900], size: _iconSize,),
                            Container(margin:EdgeInsets.all(10),child: Text(mainProvider.currentPrice['ethbtc'].toString(),style: TextStyle(fontSize: _fontSize),)),
                            Icon(FontAwesomeIcons.bitcoin,size: _iconSize,color: Colors.yellow[900],),

                          ],
                        ),
                      ],
                    ),
                ),
              ],
            ): Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: fetchData,
              color: Colors.indigo[900],
              child: Icon(Icons.refresh,color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}

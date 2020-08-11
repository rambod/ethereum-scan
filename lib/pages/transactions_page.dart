import 'package:ethereumscan/provider/main_provider.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  String _transactionId;
  Map _transaction;
  bool _transactionLoaded = false;
  bool _initState = false;
  bool _fetchingStart = false;

  @override
  void didChangeDependencies() {
    if (_initState = false) {
      Provider.of<MainProvider>(context).fetchCurrentPrice().then((value) {
        _initState = true;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * .7,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Transaction ID',
                  labelStyle: TextStyle(
                    color: Colors.black
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _transactionId = value;
                  });
                },
              ),
            ),
            RaisedButton(
              hoverColor: Colors.red,
              elevation: 10,
              color: Colors.indigo[900],
              onPressed: () {
                setState(() {
                  _fetchingStart = true;
                });
                Provider.of<MainProvider>(context, listen: false)
                    .fetchCurrentPrice()
                    .then((value) {
                  mainProvider.fetchTransaction(_transactionId).then((value) {
                    print(mainProvider.transactions);
                    setState(() {
                      _transaction = mainProvider.transactions['result'];
                      _transactionLoaded = true;
                      _fetchingStart = false;
                    });
                  });
                });
              },
              child: Icon(
                FontAwesomeIcons.search,
                color: Colors.white,
              ),
            ),
          ],),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
                  child: _transactionLoaded ? Container(
                height: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.ethereum),
                        Text(_transactionLoaded
                            ? (int.parse(_transaction['value']) /
                                        1000000000000000000)
                                    .toString() +
                                ' @ ' +
                                (double.parse(Provider.of<MainProvider>(context)
                                            .currentPrice['ethusd']) *
                                        int.parse(_transaction['value']) /
                                        1000000000000000000)
                                    .toString()
                                    .substring(0, 5) +
                                '\$'
                            : 'No data'),
                      ],
                    ),
                    Card(
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(FontAwesomeIcons.upload),
                            Text(_transactionLoaded
                                ? _transaction['from'].toString()
                                : 'No data'),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(FontAwesomeIcons.download),
                            Text(_transactionLoaded
                                ? _transaction['to'].toString()
                                : 'No data'),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Card(
                          child: Container(
                            width: MediaQuery.of(context).size.width * .45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(FontAwesomeIcons.gasPump),
                                Text(_transactionLoaded
                                    ? (int.parse(_transaction['gas']) / 1000)
                                        .toString()
                                    : 'No data'),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            width: MediaQuery.of(context).size.width * .45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(FontAwesomeIcons.piggyBank),
                                Text(_transactionLoaded
                                    ? _transaction['gasPrice'].toString()
                                    : 'No data'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Card(
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(FontAwesomeIcons.hashtag),
                            Text(_transactionLoaded
                                ? _transaction['hash'].toString()
                                : 'No data'),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(FontAwesomeIcons.boxes),
                            Text(_transactionLoaded
                                ? 'Block Number :' + int.parse(_transaction['blockNumber']).toString()
                                : 'No data'),
                            _transaction['blockNumber'] != null ? Row(children:[ Icon(FontAwesomeIcons.checkCircle,color: Colors.green[600],),Text(( int.parse(Provider.of<MainProvider>(context).currentBlockNumber['result'])  - int.parse(_transaction['blockNumber']) ).toString())]) : Icon(FontAwesomeIcons.commentDots,color:Colors.yellow[600]) ,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ):Container(height: 200, child: !_fetchingStart ? FlareActor('assets/anim/loading.in.blue.ethereum.flr') : FlareActor('assets/anim/loading.in.blue.ethereum.flr',animation: 'Loading',))),
          ),
          
        ],
      ),
    );
  }
}

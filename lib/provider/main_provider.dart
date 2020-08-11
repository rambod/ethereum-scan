import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class MainProvider with ChangeNotifier {
  String _apiKey = 'FEX4SF8CV2ZXQFBNE31UG4Y4QFCE1WA5HV';

  List _blockReward = [];
  List _estimaedBlockCountDown = [];
  List _blockNumberTimestamp = [];
  Map _transactions;
  Map _currentPrice;
  List _ethPriceHistory = [];
  List _addressTransactionList = [];
  Map _gasPrice;
  Map _currentBlockNumber;

  Map get currentBlockNumber{
    return _currentBlockNumber;
  }

  Map get gasPrice{
    return _gasPrice;
  }

  Map get transactions {
    return _transactions;
  }

  List get blockReward {
    return [..._blockReward];
  }

  List get estimaedBlockCountDown {
    return [..._estimaedBlockCountDown];
  }

  List get blockNumberTimestamp {
    return [..._blockNumberTimestamp];
  }

  List get addressTransactionList {
    return [..._addressTransactionList];
  }

  Map get currentPrice {
    return _currentPrice;
  }

  List get ethPriceHistory {
    return [..._ethPriceHistory];
  }

  Future<Null> fetchCurrentBlockNumber() async{
    await http.get('https://api.etherscan.io/api?module=proxy&action=eth_blockNumber&apikey='+ _apiKey).then((value){
      _currentBlockNumber = json.decode(value.body);
      notifyListeners();
    }).catchError((e){
      print(e);
    });
  }

  Future<Null> fetchGasPrice() async{
    await http.get('https://api.etherscan.io/api?module=proxy&action=eth_gasPrice&apikey='+ _apiKey).then((value){
      print(value.body);
      _gasPrice = json.decode(value.body);
      notifyListeners();
    }).catchError((onError){print(onError);});
  }

  Future<Null> fetchblockReward() async {
    await http
        .get(
        'https://api.etherscan.io/api?module=block&action=getblockreward&blockno=2165403&apikey=' +
            _apiKey)
        .then((value) {
      print(value.body);
      _blockReward = json.decode(value.body);
      notifyListeners();
    });
  }
  Future<Null> fetchestimaedBlockCountDown() async {
    await http
        .get(
        'https://api.etherscan.io/api?module=block&action=getblockcountdown&blockno=9100000&apikey=' +
            _apiKey)
        .then((value) {
      print(value.body);
      _estimaedBlockCountDown = json.decode(value.body);
      notifyListeners();
    });
  }
  Future<Null> fetchblockNumberTimestamp() async {
    await http
        .get(
        'https://api.etherscan.io/api?module=block&action=getblocknobytime&timestamp=1578638524&closest=before&apikey=' +
            _apiKey)
        .then((value) {
      print(value.body);
      _blockNumberTimestamp = json.decode(value.body);
      notifyListeners();
    });
  }

  Future<Null> fetchAddresstransactionList(walletAddress) async {
    await http
        .get(
            'http://api.etherscan.io/api?module=account&action=txlist&address=' +
                walletAddress +
                '&startblock=0&endblock=99999999&sort=asc&apikey=' +
                _apiKey)
        .then((value) {
      notifyListeners();
    });
  }

  Future<Null> fetchEthPriceHistory() async {
    await http
        .get(
            'https://poloniex.com/public?command=returnChartData&currencyPair=USDT_ETH&start=1435699200&end=9999999999&period=2400')
        .then((value) {
      _ethPriceHistory = json.decode(value.body);
      print(_ethPriceHistory);
      notifyListeners();
    });
  }

  Future<Null> fetchTransaction(transactionId) async {
    await http
        .get(
            'https://api.etherscan.io/api?module=proxy&action=eth_getTransactionByHash&txhash=' +
                transactionId +
                '&apikey=' +
                _apiKey)
        .then((value) {
      print(value.body);
      _transactions = json.decode(value.body);
      notifyListeners();
    });
  }

  Future<Null> fetchCurrentPrice() async {
    await http
        .get(
            'https://api.etherscan.io/api?module=stats&action=ethprice&apikey=' +
                _apiKey)
        .then((value) {
      print(value.body);
      _currentPrice = json.decode(value.body)['result'];
      notifyListeners();
    });
  }
}

//var date = new DateTime.now();
//var prevMonth = new DateTime(date.year, date.month - 1, date.day);
//print(prevMonth);
//print(new DateTime.now().millisecondsSinceEpoch);


//  Get Block And Uncle Rewards by BlockNo
//  https://api.etherscan.io/api?module=block&action=getblockreward&blockno=2165403&apikey=YourApiKeyToken
//
//  Get Estimated Block Countdown Time by BlockNo
//  https://api.etherscan.io/api?module=block&action=getblockcountdown&blockno=9100000&apikey=YourApiKeyToken
//
//  Get Block Number by Timestamp
//  [Parameters] timestamp format: Unix timestamp (supports Unix timestamps in seconds), closest value: 'before' or 'after'
//
//  https://api.etherscan.io/api?module=block&action=getblocknobytime&timestamp=1578638524&closest=before&apikey=YourApiKeyToken

//  https://api.etherscan.io/api?module=account&action=balancemulti&address=0x641f23335d322fF07231f8aA77b2015bB0c83a77&tag=latest&apikey=FEX4SF8CV2ZXQFBNE31UG4Y4QFCE1WA5HV
//  http://api.etherscan.io/api?module=account&action=txlistinternal&address=0x641f23335d322fF07231f8aA77b2015bB0c83a77&startblock=0&endblock=2702578&sort=asc&apikey=FEX4SF8CV2ZXQFBNE31UG4Y4QFCE1WA5HV
//  https://api.etherscan.io/api?module=account&action=txlistinternal&txhash=0xf02ab45c0b2e9d4d3c912c3a0488b45506d517e8522da00710949bd13f4ee1d8&apikey=FEX4SF8CV2ZXQFBNE31UG4Y4QFCE1WA5HV

//list of transactions in address
//  http://api.etherscan.io/api?module=account&action=txlist&address=0x641f23335d322fF07231f8aA77b2015bB0c83a77&startblock=0&endblock=99999999&sort=asc&apikey=FEX4SF8CV2ZXQFBNE31UG4Y4QFCE1WA5HV

//current price
//  https://api.etherscan.io/api?module=stats&action=ethprice&apikey=FEX4SF8CV2ZXQFBNE31UG4Y4QFCE1WA5HV

//transaction detail
//  https://api.etherscan.io/api?module=proxy&action=eth_getTransactionByHash&txhash=0xf02ab45c0b2e9d4d3c912c3a0488b45506d517e8522da00710949bd13f4ee1d8&apikey=YourApiKeyToken

//  https://poloniex.com/public?command=returnChartData&currencyPair=USDT_ETH&start=1435699200&end=9999999999&period=14400

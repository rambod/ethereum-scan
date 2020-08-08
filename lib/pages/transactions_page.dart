import 'package:ethereumscan/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  String _transactionId;

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    return Container(
      child: Column(
        children: [
          TextField(
            onChanged: (value){
              setState(() {
                _transactionId = value;
              });
            },
          ),
          RaisedButton(
            onPressed: (){mainProvider.fetchTransaction(_transactionId);},
            child: Text('Test'),
          )
        ],
      ),
    );
  }
}

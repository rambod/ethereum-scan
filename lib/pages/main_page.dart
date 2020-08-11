import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ethereumscan/pages/blocks_page.dart';
import 'package:ethereumscan/pages/home_page.dart';
import 'package:ethereumscan/pages/setting_page.dart';
import 'package:ethereumscan/pages/transactions_page.dart';
import 'package:ethereumscan/pages/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'converter_page.dart';

enum pageSelected {
  Converter,
  Transaction,
  Ethereum,
  Wallet,
  Info,
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _selectedPaged = 2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(pageSelected.values[_selectedPaged].toString().substring(13),style: TextStyle(fontWeight: FontWeight.bold),),),),
      body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: _selectedPaged == 2 ? HomePage() : _selectedPaged == 0 ? ConverterPage() : _selectedPaged == 1 ? TransactionPage() : _selectedPaged == 3 ? WalletPage(): _selectedPaged == 4 ? SettingPage() : HomePage()
            ),
          ),
        ),

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey[10],
        color: Colors.grey[300],
        index: 2,
        animationDuration: Duration(milliseconds: 1000),
        animationCurve: Curves.fastOutSlowIn,
        items: [
          Icon(FontAwesomeIcons.calculator,size: 20,color: Colors.indigo[900]),
          Icon(FontAwesomeIcons.list,size: 20,color: Colors.indigo[900]),
          Icon(FontAwesomeIcons.ethereum,size: 40,color: Colors.indigo[900]),
          Icon(FontAwesomeIcons.wallet,size: 20,color: Colors.indigo[900]),
          Icon(FontAwesomeIcons.info,size: 20,color: Colors.indigo[900]),
        ],
        onTap: (index){
          print(index.toString());
          setState(() {
            _selectedPaged = index;
          });
        },
      ),
    );
  }
}

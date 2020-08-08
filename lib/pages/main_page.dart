import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ethereumscan/pages/blocks_page.dart';
import 'package:ethereumscan/pages/home_page.dart';
import 'package:ethereumscan/pages/setting_page.dart';
import 'package:ethereumscan/pages/transactions_page.dart';
import 'package:ethereumscan/pages/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum pageSelected {
  Blocks,
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
      appBar: AppBar(title: Center(child: Text(pageSelected.values[_selectedPaged].toString().substring(13)),),),
      body: SafeArea(
        child: Container(
          child: Center(
            child: _selectedPaged == 2 ? HomePage() : _selectedPaged == 0 ? BlocksPage() : _selectedPaged == 1 ? TransactionPage() : _selectedPaged == 3 ? WalletPage(): _selectedPaged == 4 ? SettingPage() : HomePage()
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey[10],
        color: Colors.blue[900],
        index: 2,
        animationDuration: Duration(milliseconds: 1000),
        animationCurve: Curves.fastOutSlowIn,
        items: [
          Icon(FontAwesomeIcons.boxes,size: 20,color: Colors.white),
          Icon(FontAwesomeIcons.exchangeAlt,size: 20,color: Colors.white),
          Icon(FontAwesomeIcons.ethereum,size: 40,color: Colors.white),
          Icon(FontAwesomeIcons.wallet,size: 20,color: Colors.white),
          Icon(FontAwesomeIcons.info,size: 20,color: Colors.white),
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

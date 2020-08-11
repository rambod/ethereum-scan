import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';


class ConverterPage extends StatefulWidget {
  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  String _dropDownValue = 'Wei';
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .7,
                    padding: EdgeInsets.all(30),

                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Wei',
                        hintText: '0000001',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                        ),
                      ),
                    ),
                  ),
                  DropdownButton(
                    value: _dropDownValue,
                    onChanged: (value){
                      print(value);
                      setState(() {
                        _dropDownValue = value;

                      });
                    },
                    items: <String>['Wei','KWei','MWei','Gwei','Szabo','Finney','ETH','KEther','MEther','GEther','TEther'].map<DropdownMenuItem<String>>((String e){
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                  )
                ],
              ),

              Container(
                padding: EdgeInsets.all(20),
                child: Card(child: Container(

                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Wei : 1000000000000000000'),
                      Text('KWei : 1000000000000000'),
                      Text('MWei : 1000000000000'),
                      Text('GWei (Shannon) : 1000000000'),
                      Text('Szabo : 1000000'),
                      Text('Finney : 1000'),
                      Text('Ether : 1'),
                      Text('KEther : 0.001'),
                      Text('MEther : 0.000001'),
                      Text('GEther : 0.000000001'),
                      Text('TEther : 0.000000000001'),
                    ],
                  ),
                ),),
              ),
              Container(height: 70,
                  child: FlareActor('assets/anim/loading.in.blue.ethereum.flr',
                    animation: 'Loading',)),

            ],
          ),
        )

    );
  }
}

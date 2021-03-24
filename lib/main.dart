import 'package:flutter/material.dart';

//Main activity method
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      //Home page creation
      home: MyHomePage(title: 'CIS 3334 Currency Converter'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//Our code goes in this method
class _MyHomePageState extends State<MyHomePage> {

  final dollarTextField = TextEditingController();
  final euroTextField = TextEditingController();

  double _dollars = 0;
  double _euros = 0;
  double _conversionRate = 1.19;

  void _convertToDollars(){
    setState(() {
    _euros = double.parse(euroTextField.text);
    _dollars = _euros / _conversionRate;
    dollarTextField.text = _dollars.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Dollars:',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextField(
              controller: dollarTextField,
            ),
            ElevatedButton(
                onPressed: (){
                  _dollars = double.parse(dollarTextField.text);
                  _euros = _dollars * _conversionRate;
                  euroTextField.text = _euros.toStringAsFixed(2);
                },
                child: Text("Convert to Euros")),
            Text(
              'Euros:',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextField(
              controller: euroTextField,
            ),
            ElevatedButton(
                onPressed: _convertToDollars,
                child: Text("Convert to Dollars")),
          ],
        ),
      ),
    );
  }
}

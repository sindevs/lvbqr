import 'package:flutter/material.dart';

class History extends StatefulWidget {
  History({Key key}) : super(key: key);

  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.all(20.0),
                ),
                new Text("ລາຍການທັງໝົດ"),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/addlist");
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
          backgroundColor: Colors.redAccent,
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async' show Future;

class UpdateScreen extends StatefulWidget {
  UpdateScreen({Key key}) : super(key: key);

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Asset'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selection = "ABC";

  @override
  Widget build(BuildContext context) {
    Widget buttonWidget = new FlatButton(
      textColor: Colors.blueGrey,
      color: Colors.white,
      child: new Text('To Selection Screen'),
      onPressed: _buttonTapped,
    );
    List<Widget> widgets = new List<Widget>();
    widgets.add(buttonWidget);
    if (_selection != null) {
      Widget textWidget = new Text(_selection);
      widgets.add(textWidget);
    }

    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text("Home Page, with selection"),
      // ),
      body: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
        child: new Column(
          children: widgets,
        ),
      ),
    );
  }

  Future _buttonTapped() async {
    var results =
        await Navigator.of(context).push(new MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return new SelectionPage();
      },
    ));

    if (results != null && results.containsKey('selection')) {
      setState(() {
        _selection = results['selection'];
      });
    }
  }
}

const String ITEM_1 = 'Item 1';
const String ITEM_2 = 'Item 2';

class SelectionPage extends StatelessWidget {
  SelectionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buttons = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new FlatButton(
            textColor: Colors.blueGrey,
            color: Colors.white,
            child: new Text(ITEM_1),
            onPressed: () => _selectItem(ITEM_1, context),
          ),
          new FlatButton(
            textColor: Colors.blueGrey,
            color: Colors.white,
            child: new Text(ITEM_2),
            onPressed: () => _selectItem(ITEM_2, context),
          ),
        ],
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Selection page"),
      ),
      body: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
        child: buttons,
      ),
    );
  }

  void _selectItem(String value, BuildContext context) {
    Navigator.of(context).pop({'selection': value});
  }
}

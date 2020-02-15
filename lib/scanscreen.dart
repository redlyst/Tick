import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'model.dart';
import 'color_pallete.dart' as colorPallete;
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'page_view_card_list_tile.dart';
import 'package:http/http.dart' as http;
import 'updatescreen.dart';
import 'statusscreen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen(
      this._assetId,
      this._assetNumber,
      this._assetName,
      this._assetBuyDate,
      this._brandName,
      this._assetCategoryName,
      this._categoryNumber,
      this._userName,
      this._userNrp,
      this._userDept,
      this._statusId,
      this._statusName,
      this._roomId,
      this._roomName,
      this._locName,
      {Key key})
      : super(key: key);
  // final Color color;
  //  final String _scanResult;
  final String _assetId;
  final String _assetNumber;
  final String _assetName;
  final String _assetBuyDate;
  final String _brandName;
  final String _assetCategoryName;
  final String _categoryNumber;
  final String _userName;
  final String _userNrp;
  final String _userDept;
  final String _statusId;
  final String _statusName;
  final String _roomId;
  final String _roomName;
  final String _locName;

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // String _scanResult;
  // String _categoryNumber;

  String _assetId;
  String _assetNumber;
  String _assetName;
  String _assetBuyDate;
  String _brandName;
  String _assetCategoryName;
  String _userName;
  String _userNrp;
  String _userDept;
  String _statusId;
  String _statusName;
  String _roomId;
  String _roomName;
  String _locName;

  // bool _sResultVisibility = false;
  String _nA = 'Not Available';
  // int _totalRequest;
  // String dropdownValue;

  TextEditingController _controllerDept = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerRoom = TextEditingController();
  TextEditingController _controllerStatus = TextEditingController();

  bool _formView = true;
  bool _formUpdate = false;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double boxwidth = screenwidth * 0.4;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Scan Result"),
        ),
        body: Container(
          width: screenwidth,
          height: screenheight,
          child: Padding(
            padding: EdgeInsets.all(15),
            // padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: Card(
              elevation: 0,
              // color: Color.fromRGBO(64, 122, 255, 1),
              color: Color(0xFFf0f0f0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // Container(
                    //   height: 400,
                    //   child: Column(
                    //     children: <Widget>[
                    //       Text('A'),
                    //       Text('B'),
                    //       Text('C'),
                    //       Text(_scanResult)
                    //     ],
                    //   ),
                    //   // width: 200,
                    // )

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        PageViewCardListTile(
                          title: 'Asset Number',
                          content: _assetNumber,
                          biggerContent: true,
                        ),
                        PageViewCardListTile(
                            title: 'Asset Name',
                            content: _assetName.toUpperCase()),
                        PageViewCardListTile(
                            title: 'Buy Date', content: _assetBuyDate),
                        PageViewCardListTile(
                            title: 'Brand', content: _brandName),
                        PageViewCardListTile(
                            title: 'Category', content: _assetCategoryName),
                        Visibility(
                          visible: _formView,
                          child: PageViewCardListTile(
                              title: 'User', content: _userName),
                        ),
                        Visibility(
                          visible: _formUpdate,
                          child: InkWell(
                            onTap: () {
                              snackMe(_userName);
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: TextField(
                                enabled: false,
                                controller: _controllerName,
                                autofocus: false,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'User',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: _formView,
                          child: PageViewCardListTile(
                              title: 'User Department', content: _userDept),
                        ),
                        Visibility(
                          visible: _formUpdate,
                          child: InkWell(
                            onTap: () {
                              snackMe(_userDept);
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: TextField(
                                enabled: false,
                                controller: _controllerDept,
                                autofocus: false,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'User Department',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: _formView,
                          child: PageViewCardListTile(
                              title: 'Status',
                              content: _statusName.toUpperCase()),
                        ),
                        Visibility(
                          visible: _formUpdate,
                          child: InkWell(
                            onTap: () {
                              // snackMe(_statusName);
                              _statusTapped();
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: TextField(
                                enabled: false,
                                controller: _controllerStatus,
                                autofocus: false,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Status',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                            visible: _formView,
                            child: PageViewCardListTile(
                                title: 'Room', content: _roomName)),
                        Visibility(
                          visible: _formUpdate,
                          child: InkWell(
                            onTap: () {
                              snackMe(_roomName);
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: TextField(
                                enabled: false,
                                controller: _controllerRoom,
                                autofocus: false,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Room',
                                ),
                              ),
                            ),
                          ),
                        ),
                        PageViewCardListTile(
                          title: 'Location',
                          content: _locName.toUpperCase(),
                        ),
                        Visibility(
                          visible: _formView,
                          child: SizedBox(
                            child: CupertinoButton(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text(
                                    'Update',
                                    style: TextStyle(
                                      color: Color(0xff0080ff),
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: Icon(
                                      CupertinoIcons.down_arrow,
                                      color: Color(0xff0080ff),
                                    ),
                                  ),
                                ],
                              ),
                              color: Color(0xff6ab5ff).withOpacity(0.3),
                              onPressed: () {
                                setState(() {
                                  _formView = false;
                                  _formUpdate = true;
                                  _controllerName.text = _userName;
                                  _controllerDept.text = _userDept;
                                  _controllerRoom.text = _roomName;
                                  _controllerStatus.text = _statusName;
                                });
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          // new ContaPage(new Color(0xFF66BB6A)),
                                          new UpdateScreen(),
                                    ));
                                // addHistory();

                                // snackMe("Coming soon!");
                              },
                            ),
                          ),
                        ),
                        Visibility(
                          visible: _formUpdate,
                          child: SizedBox(
                            child: CupertinoButton(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text(
                                    'Update Now',
                                    style: TextStyle(
                                      color: Color(0xff0080ff),
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: Icon(
                                      CupertinoIcons.down_arrow,
                                      color: Color(0xff0080ff),
                                    ),
                                  ),
                                ],
                              ),
                              color: Color(0xff6ab5ff).withOpacity(0.3),
                              onPressed: () {
                                setState(() {
                                  _formView = true;
                                  _formUpdate = false;
                                });
                                /* Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          // new ContaPage(new Color(0xFF66BB6A)),
                                          new UpdateScreen(),
                                    )); */
                                // addHistory();

                                // snackMe("Coming soon!");
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

/*   Widget textTap() {
    return InkWell(
      onTap: () {
        snackMe(widget._userName);
      },
      child: TextField(
        enabled: false,
        controller: _controller,
        autofocus: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'User',
        ),
      ),
    );
  } */

  Widget snackMe(String message) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 2),
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      // action: SnackBarAction(
      //   label: 'OK',
      //   onPressed: () {
      //     // Some code to undo the change.
      //   },
      // ),
    );

    // Find the Scaffold in the widget tree and use
    // it to show a SnackBar.
    // Scaffold.of(context).showSnackBar(snackBar);
    _scaffoldKey.currentState.showSnackBar(snackBar);

    return snackBar;
  }

  void addHistory() async {
    /* try {
      Dio dio = new Dio();
      Response response = await dio.get(
          "http://10.2.49.12/it_is/Api/addNewHistory/8/5/1612075/Digitalization Function/DEWI ANGGRAINI/6");
      print(response.data.toString());
    } catch (e) {
      print(e);
    } */

    var url =
        "http://10.2.49.12/it_is/Api/addNewHistory/8/5/1612075/Digitalization Function/DEWI ANGGRAINI/6";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      // var jsonResponse = convert.jsonDecode(response.body);
      // var itemCount = jsonResponse['totalItems'];
      // print('Number of books about http: $itemCount.');
      print('Request succes with status: ${response.statusCode}.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    _roomId = widget._roomId;
    _assetId = widget._assetId;
    _assetNumber = widget._assetNumber;
    _assetName = widget._assetName;
    _assetBuyDate = widget._assetBuyDate;
    _brandName = widget._brandName;
    _assetCategoryName = widget._assetCategoryName;
    _userName = widget._userName;
    _userNrp = widget._userNrp;
    _userDept = widget._userDept;
    _statusId = widget._statusId;
    _statusName = widget._statusName;
    _roomName = widget._roomName;
    _locName = widget._locName;
    super.initState();
  }

  Future _statusTapped() async {
    var results =
        await Navigator.of(context).push(new MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return new StatusScreen();
      },
    ));

    print(results);

    if (results != null && results.containsKey('selection')) {
      setState(() {
        _statusName = results['selection'];
        _controllerName.text = results['selection'];
      });
    }
  }
}

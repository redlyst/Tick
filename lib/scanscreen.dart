import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'model.dart';
import 'color_pallete.dart' as colorPallete;
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'page_view_card_list_tile.dart';
import 'package:http/http.dart' as http;

class ScanScreen extends StatefulWidget {
  const ScanScreen(
      this._assetName,
      this._assetNumber,
      this._buyDate,
      this._brandName,
      this._categoryName,
      this._categoryNumber,
      this._locName,
      this._roomName,
      this._statusName,
      this._userDepartment,
      this._userName,
      this._userNrp,
      this._roomId,
      this._assetid,
      {Key key})
      : super(key: key);
  // final Color color;
  //  final String _scanResult;
  final String _assetName;
  final String _assetNumber;
  final String _buyDate;
  final String _brandName;
  final String _categoryName;
  final String _categoryNumber;
  final String _userName;
  final String _userNrp;
  final String _userDepartment;
  final String _statusName;
  final String _roomName;
  final String _locName;
  final String _roomId;
  final String _assetid;

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _scanResult;
  String _assetName = '';
  String _assetNumber = '';
  String _buyDate = '';
  String _brandName = '';
  String _categoryName = '';
  String _categoryNumber = '';
  String _userName = '';
  String _userNrp = '';
  String _userDepartment = '';
  String _statusName = '';
  String _roomName = '';
  String _locName = '';
  String _roomId = '';
  String _assetId = '';
  bool _sResultVisibility = false;
  String _nA = 'Not Available';
  int _totalRequest;
  String dropdownValue;

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
          height: 600,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    PageViewCardListTile(
                      title: 'Asset Number',
                      content: widget._assetNumber,
                      biggerContent: true,
                    ),
                    PageViewCardListTile(
                        title: 'Asset Name', content: widget._assetName),
                    PageViewCardListTile(
                        title: 'Buy Date', content: widget._buyDate),
                    PageViewCardListTile(
                        title: 'Brand', content: widget._brandName),
                    PageViewCardListTile(
                        title: 'Category', content: widget._categoryName),
                    PageViewCardListTile(
                        title: 'User', content: widget._userName),
                    PageViewCardListTile(
                        title: 'User NRP', content: widget._userNrp),
                    PageViewCardListTile(
                        title: 'User Department',
                        content: widget._userDepartment),
                    PageViewCardListTile(
                        title: 'Status', content: widget._statusName),
                    PageViewCardListTile(
                        title: 'Room', content: widget._roomName),
                    PageViewCardListTile(
                      title: 'Location',
                      content: widget._locName,
                    ),
                    SizedBox(
                      child: CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              'Update',
                              style: TextStyle(
                                color: Color(0xFFB42827),
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            RotatedBox(
                              quarterTurns: 3,
                              child: Icon(
                                CupertinoIcons.down_arrow,
                                color: Color(0xFFB42827),
                              ),
                            ),
                          ],
                        ),
                        color: Colors.redAccent.withOpacity(0.3),
                        onPressed: () {
                          addHistory();

                          // snackMe("Coming soon!");
                        },
                      ),
                    ),

                    /* DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['One', 'Two', 'Free', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ) */
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

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

  var url = "http://10.2.49.12/it_is/Api/addNewHistory/8/5/1612075/Digitalization Function/DEWI ANGGRAINI/6";

  var response = await http.get(url);

  if (response.statusCode == 200) {
    // var jsonResponse = convert.jsonDecode(response.body);
    // var itemCount = jsonResponse['totalItems'];
    // print('Number of books about http: $itemCount.');
    print('Request failed with status: ${response.statusCode}.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }

  }
}

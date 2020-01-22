import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'model.dart';
import 'color_pallete.dart' as colorPallete;
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'page_view_card_list_tile.dart';

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

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
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
  bool _sResultVisibility = false;
  String _nA = 'Not Available';
  int _totalRequest;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double boxwidth = screenwidth * 0.4;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Scan Result"),
        ),
        body: Container(
          width: screenwidth,
          height: screenwidth,
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
/*                     SizedBox(
                        child: CupertinoButton(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                'CSC check',
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
                          onPressed: () {},
                        ),
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
}

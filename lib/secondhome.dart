import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'model.dart';
import 'color_pallete.dart' as colorPallete;
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class SecondHomeScreen extends StatefulWidget {
  SecondHomeScreen({Key key}) : super(key: key);

  _SecondHomeScreenState createState() => _SecondHomeScreenState();
}

class _SecondHomeScreenState extends State<SecondHomeScreen> {
  String _scanResult;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: colorPallete.primaryColor));

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // backgroundColor: Color.fromRGBO(64, 122, 255, 1),
        drawer: drawer(),
        // appBar: AppBar(
        //   elevation: 0.0,
        //   // centerTitle: true,
        //   // title: Text(_grAppBarTitleText),
        //   // title: Text('Ticketing System'),
        //   automaticallyImplyLeading: false,
        //   actions: <Widget>[
        //     new Container(),
        //   ],
        // ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.white,
          elevation: 4.0,
          icon: const Icon(
            Icons.camera,
            color: Color.fromRGBO(64, 122, 255, 1),
          ),
          label: const Text('Stock Scan'),
          onPressed: () {
            // initPlatformState();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Color.fromRGBO(64, 122, 255, 1),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
              ),
              IconButton(
                icon: Icon(Icons.help, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, '/shome');
                },
              )
            ],
          ),
        ),
        body: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    double screenwidth = MediaQuery.of(context).size.width;
    double boxwidth = screenwidth * 0.4;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height / 4,
            child: Card(
              color: Color.fromRGBO(64, 122, 255, 1),
              // color: Colors.white,
              // elevation: 4.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.format_list_bulleted,
                            size: 30, color: Colors.white),
                        // Icon(_getIcon(index),
                        //     size: 30, color: Color.fromRGBO(64, 122, 255, 1)),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    //margin: EdgeInsets.only(top: 8.0),
                    // padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Request",
                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.0,
                            color: Colors.white,
                            // color: Color.fromRGBO(64, 122, 255, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
              child:
                  Container(color: colorPallete.accentColor, child: Text('B'))),
        ),
      ],
    );
  }

  Widget buildIcon(int index, String label, BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Expanded(
          // child:
          InkResponse(
            child: Card(
              color: Color.fromRGBO(64, 122, 255, 1),
              // color: Colors.white,
              // elevation: 4.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(_getIcon(index), size: 30, color: Colors.white),
                        // Icon(_getIcon(index),
                        //     size: 30, color: Color.fromRGBO(64, 122, 255, 1)),
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    //margin: EdgeInsets.only(top: 8.0),
                    // padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          label,
                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.0,
                            color: Colors.white,
                            // color: Color.fromRGBO(64, 122, 255, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // enableFeedback: true,
            // onTap: () => _onTileClicked(index, context),
          ),
          // ),
        ],
      ),
    );
  }

  Widget buildMenu(BuildContext context) {
    Widget child;

    child = Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    _buildGridMenuButton(0, 'Request', context),
                    _buildGridMenuButton(1, 'Response', context),
                    _buildGridMenuButton(2, 'Assets', context),
                    _buildGridMenuButton(3, 'Inventory', context),
                    // _buildGridMenuButton(4, 'Inventory', context),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
    return new Container(child: child);
  }

  Container _buildGridMenuButton(
      int index, String label, BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double boxwidth = screenwidth * 0.4;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: InkResponse(
              child: Card(
                color: Color.fromRGBO(64, 122, 255, 1),
                // color: Colors.white,
                // elevation: 4.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(_getIcon(index), size: 30, color: Colors.white),
                          // Icon(_getIcon(index),
                          //     size: 30, color: Color.fromRGBO(64, 122, 255, 1)),
                        ],
                      ),
                    ),
                    Container(
                      width: boxwidth,
                      //margin: EdgeInsets.only(top: 8.0),
                      // padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            label,
                            // overflow: TextOverflow.ellipsis,
                            // maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.0,
                              color: Colors.white,
                              // color: Color.fromRGBO(64, 122, 255, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              enableFeedback: true,
              onTap: () => _onTileClicked(index, context),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIcon(int index) {
    if (index == 0) {
      return Icons.format_list_bulleted;
    } else if (index == 1) {
      return Icons.done_all;
    } else if (index == 2) {
      return Icons.data_usage;
    } else {
      return Icons.widgets;
    }
  }

  // _loadPreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   setState(() {
  //     _username = prefs.getString('username');
  //     _status = prefs.getString('status');
  //     _role = prefs.getString('role');
  //     debugPrint('# Get Username as : ' + prefs.getString('username'));
  //     debugPrint('# Get Status as : ' + prefs.getString('status'));
  //     // debugPrint('# Set Role as : ' + prefs.getString('role'));
  //     if (_role == 'qc') {
  //       _defaultRoleTitleText = _qcRoleTitleText;
  //       _defaultAppBarTitleText = _qcAppBarTitleText;
  //       debugPrint('# Login as : ' + _qcRoleTitleText);
  //     } else {
  //       _defaultRoleTitleText = _grRoleTitleText;
  //       _defaultAppBarTitleText = _grAppBarTitleText;
  //       debugPrint('# Login as : ' + _grRoleTitleText);
  //     }
  //   });
  // }

  void _onTileClicked(int index, context) {
    if (index == 0) {
      debugPrint("# Search Menu Selected");
      // Navigator.pushNamed(context, '/search');
    } else if (index == 1) {
      debugPrint("# Paging Menu Selected");
      // Navigator.pushNamed(context, '/paging');
    } else if (index == 2) {
      debugPrint("# Finish Menu Selected");
      // Navigator.pushNamed(context, '/finish');
    }
  }

  Widget drawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new ListTile(
              leading: new Icon(Icons.settings),
              title: new Text('Settings'),
              // onTap: () {
              //   Navigator.pop(context);
              //   Navigator.pushNamed(context, '/setting');
              // },
            ),
            new ListTile(
              leading: new Icon(Icons.help),
              title: new Text('Help & feedback'),
              // onTap: () => _onListTileTap(context),
            ),
            new Expanded(
              child: new Align(
                alignment: Alignment.bottomCenter,
                child: new ListTile(
                  // leading: new Icon(Icons.exit_to_app),
                  trailing: new Icon(Icons.exit_to_app),
                  title: new Text('Logout'),
                  // onTap: () => logoutOperation(),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              ),
            ),
          ],
        ),

        // child: ListView(
        //     padding: const EdgeInsets.only(top: 0.0),
        //     children: <Widget>[
        //   // new UserAccountsDrawerHeader(
        //   //   // decoration: BoxDecoration(
        //   //   //   shape: BoxShape.rectangle,
        //   //   //   // borderRadius: BorderRadius.only(
        //   //   //   //   bottomLeft: Radius.circular(50.0),
        //   //   //   //   bottomRight: Radius.circular(50.0),
        //   //   //   // ),
        //   //   //   image: DecorationImage(
        //   //   //     image: AssetImage('images/2806.jpg'),
        //   //   //     fit: BoxFit.cover,
        //   //   //   ),
        //   //   // ),
        //   //   // accountName: Text(_username.toUpperCase()),
        //   //   accountName: Text(
        //   //     'Muhammad Akbar Hidayatullah',
        //   //     // style: TextStyle(
        //   //     //   shadows: [
        //   //     //     Shadow(
        //   //     //       blurRadius: 1.0,
        //   //     //       color: Colors.white,
        //   //     //       offset: Offset(1.0, 1.0),
        //   //     //     ),
        //   //     //   ],
        //   //     //   color: Colors.black,
        //   //     // ),
        //   //   ),
        //   //   // accountEmail: Text(_defaultRoleTitleText),
        //   //   accountEmail: Text('id.akabaru@gmail.com'),
        //   //   // currentAccountPicture: new CircleAvatar(
        //   //   //     backgroundColor: Colors.white,
        //   //   //     child: Image.asset('images/16666.jpg')),
        //   // ),
        //   new ListTile(
        //     leading: new Icon(Icons.exit_to_app),
        //     // trailing: new Icon(Icons.exit_to_app),
        //     title: new Text('Logout'),
        //     // onTap: () => logoutOperation(),
        //     onTap: () {
        //       Navigator.pushReplacementNamed(context, '/');
        //     },
        //   ),
        //   new Divider(),
        //   new ListTile(
        //     leading: new Icon(Icons.settings),
        //     title: new Text('Settings'),
        //     // onTap: () {
        //     //   Navigator.pop(context);
        //     //   Navigator.pushNamed(context, '/setting');
        //     // },
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.help),
        //     title: new Text('Help & feedback'),
        //     // onTap: () => _onListTileTap(context),
        //   ),
        // ])
      ),
    );
  }

/*   // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes =
          await FlutterBarcodeScanner.scanBarcode("#FF90CAF9", "CANCEL", true);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // if (!mounted) {
    //   print('A');
    // } else if (mounted) {
    //   print('B');
    // }

    if (barcodeScanRes.isNotEmpty) {
      setState(() {
        // _scanResult = barcodeScanRes;
        getHttp(barcodeScanRes);
      });
    }

    print(barcodeScanRes);
  } */

  void getHttp(String barcodeScan) async {
    try {
      // setState(() {
      //   shimmerVisibility = true;
      //   tvVisibility = false;
      //   qcVisibility = false;
      //   grVisibility = false;
      // });

      // FormData formData = new FormData.from({"sn": _scanResult});

      // Response response = await Dio()
      //     .post("http://10.2.49.12/it_is/Api/getAsset/", data: formData);

      // final getData = GetData.fromJson(response.data);

      // Dio dio = new Dio();

      Response response = await Dio()
          .get("http://10.2.49.12/it_is/Api/getAsset/" + barcodeScan);
      final getData = GetData.fromJson(response.data[0]);

      setState(() {
        _scanResult = response.data.toString();
      });

      // ProductList productsList = ProductList.fromJson(jsonResponse);

      // if (getData == null) {
      //   // if (productsList.products.length == 0) {
      //   setState(() {
      //     shimmerVisibility = false;
      //     tvVisibility = true;
      //     // stsVisiblebtn = false;
      //     // stsVisibleNull = true;
      //   });
      // } else {
      //   shimmerVisibility = false;
      //   tvVisibility = true;
      //   setState(() {
      //     _id = getData.id ?? 'Not Available';
      //     _sn = getData.sn ?? 'Not Available';
      //     _deskripsi = getData.deskripsi ?? 'Not Available';
      //     _generate_date = getData.generateDate ?? 'Not Available';
      //     _status_qc = getData.statusQc == '0' || getData.statusQc == null
      //         ? 'Not Available'
      //         : getData.statusQc;
      //     _status_qc_date = getData.statusQcDate ?? 'Not Available';
      //     _status_qc_update_by = getData.statusQcUpdatedBy ?? 'Not Available';
      //     _status_gr = getData.statusGr == '0' || getData.statusGr == null
      //         ? 'Not Available'
      //         : getData.statusGr;
      //     _status_gr_date = getData.statusGrDate ?? 'Not Available';
      //     _status_gr_update_by = getData.statusGrUpdatedBy ?? 'Not Available';
      //     _status_gi = getData.statusGi == '0' || getData.statusGi == null
      //         ? 'Not Available'
      //         : getData.statusGi;

      //     qcVisibility = getData.statusQc == '0' || getData.statusQc == null
      //         ? true
      //         : false;
      //     grVisibility = getData.statusQc == '1' &&
      //             getData.statusGi == '1' &&
      //             getData.statusGr == '0'
      //         ? true
      //         : false;

      //     // if (getData.statusQc == '0') {
      //     //   qcVisibility = true;
      //     // }
      //     // if (getData.statusGr == '0') {
      //     //   grVisibility = true;
      //     // }
      //     _subcolor = Colors.grey;
      //   });
      // }
    } catch (e) {
      print(e);
    }
  }
}

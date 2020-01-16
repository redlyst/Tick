import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:ticketing/model.dart';
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
            initPlatformState();
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
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Text('WASD'),
          ],
        )
/*         Positioned(
          top: 20.0,
          left: 0.0,
          right: 0.0,
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              buildIcon(0, 'Request', context),
              buildIcon(1, 'Response', context),
              buildIcon(2, 'Assets', context),
              buildIcon(3, 'Inventory', context),
              // _buildGridMenuButton(4, 'Inventory', context),
            ],
          ),
        ), */
        /*   Positioned(
          top: 130.0,
          left: 0.0,
          right: 0.0,
          child: Container(
              color: colorPallete.accentColor,
              width: double.infinity,
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height / 1.8) -
                  120.0,
              child: Text('data')
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //   child:
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisSize: MainAxisSize.max,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              // RichText(
              // textAlign: TextAlign.start,
              // text: TextSpan(children: [
              // TextSpan(
              //   text: 'Welcome! ',
              //   style: TextStyle(
              //     fontWeight: FontWeight.w500,
              //     fontSize: 26.0,
              //   ),
              // ),
              // TextSpan(
              //   text: 'Ryan',
              //   style: TextStyle(
              //     fontSize: 20.0,
              //   ),
              // ),
              // ]),
              // ),
              // Row(
              //   mainAxisSize: MainAxisSize.max,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              // Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: <Widget>[
              //     SizedBox(
              //       width: 60.0,
              //       height: 60.0,
              //       child: CupertinoButton(
              //         padding: EdgeInsets.zero,
              //         borderRadius: BorderRadius.circular(20.0),
              //         onPressed: () {},
              //         color: Color(0xFFB42827),
              //         child: Icon(
              //           Icons.ac_unit,
              //           size: 26.0,
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       height: 8.0,
              //     ),
              //     Container(
              //       width: 60.0,
              //       height: 20.0,
              //       child: Center(
              //         child: Text(
              //           "Inventory",
              //           style: Theme.of(context)
              //               .textTheme
              //               .caption
              //               .copyWith(color: Colors.white),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // children: <Widget>[
              // GridView.count(
              //   crossAxisCount: 1,
              //   children: <Widget>[
              //     // buildIcon(0, 'Request', context),
              //     // buildIcon(1, 'Response', context),
              //     // buildIcon(2, 'Assets', context),
              //     // buildIcon(3, 'Inventory', context),
              //   ],
              // )
              // ],
              // )
              // Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       GridView.count(
              //         crossAxisCount: 4,
              //         mainAxisSpacing: 4.0,
              //         crossAxisSpacing: 4.0,
              //         physics: NeverScrollableScrollPhysics(),
              //         shrinkWrap: true,
              //         children: [
              // buildIcon(0, 'Request', context),
              // buildIcon(1, 'Response', context),
              // buildIcon(2, 'Assets', context),
              // buildIcon(3, 'Inventory', context),
              // _buildGridMenuButton(4, 'Inventory', context),
              // ],
              // ),
              // ])
              // buildMenu(context)
              /* SquareButton(
                          icon: Icon(FontAwesomeIcons.search),
                          label: 'Lookup',
                        ),
                        SquareButton(
                          icon: Icon(FontAwesomeIcons.userAlt),
                          label: 'Customer',
                        ),
                        SquareButton(
                          icon: Icon(FontAwesomeIcons.headset),
                          label: 'Contacts',
                        ),
                        SquareButton(
                          icon: Icon(FontAwesomeIcons.solidComments),
                          label: 'Message',
                        ), */
              //   ],
              // ),
              /* Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          width: 7.0,
                          height: 7.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFB42827),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          'Service Request',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(color: Colors.white),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        /* Icon(
                            CupertinoIcons.ellipsis,
                            color: Colors.white,
                          ), */
                      ],
                    ),
                  ), */
              //   ],
              // ),
              // ),
              ),
        ),
       */
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

  // Platform messages are asynchronous, so we initialize in an async method.
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
  }

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

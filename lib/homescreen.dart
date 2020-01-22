import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:dio/dio.dart';
import 'color_pallete.dart';
import 'model_ticket.dart';
import 'page_view_card.dart';
import 'tracking_lines.dart';
import 'model.dart';
import 'page_view_card_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'model_t.dart';
import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController(
    viewportFraction: 0.92,
    initialPage: 0,
  );

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

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
        label: const Text('Asset Scan'),
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
                // Navigator.pushNamed(context, '/shome');
                getTicket();
              },
            )
          ],
        ),
      ),
      body: ListView(
        // padding: EdgeInsets.all(10.0),
        padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
        children: [
          // Hero(
          //   tag: 'login',
          //   child: Container(
          //     // width: double.infinity,
          //     width: 450,
          //     height: 450,
          //     // height: mediaQuery.size.height / 1.7,
          //     decoration: BoxDecoration(
          //       shape: BoxShape.rectangle,
          //       // borderRadius: BorderRadius.only(
          //       //   bottomLeft: Radius.circular(50.0),
          //       //   bottomRight: Radius.circular(50.0),
          //       // ),
          //       image: DecorationImage(
          //         image: AssetImage('images/5204985.jpg'),
          //         fit: BoxFit.contain,
          //       ),
          //     ),
          //   ),
          // )
          Row(children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Welcome!',
                      style: TextStyle(
                        // color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Hero(
                      tag: 'login',
                      child: Text(
                        'Muhammad Akbar Hidayatullah',
                        style: TextStyle(
                          // color: Colors.white,
                          // fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),

          Card(
            // height: 120.0,
            color: primaryColor,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Container(
                          width: 45.0,
                          height: 45.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Colors.white.withOpacity(0.1),
                          ),
                          child: Center(
                            child: Icon(
                              IconData(0xF391,
                                  fontFamily: CupertinoIcons.iconFont,
                                  fontPackage: CupertinoIcons.iconFontPackage),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            '666',
                            style: Theme.of(context)
                                .textTheme
                                .headline
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                          ),
                          Text(
                            'Ticket Request',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                // .copyWith(color: Colors.white.withOpacity(0.5)),
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      CupertinoButton(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'SUBMISSION',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            // padding: const EdgeInsets.only(bottom: 15.0, top: 10),
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                // Container(
                //   width: 7.0,
                //   height: 7.0,
                //   decoration: BoxDecoration(
                //     color: Color(0xFFB42827),
                //     borderRadius: BorderRadius.circular(5.0),
                //   ),
                // ),
                // SizedBox(
                //   width: 8.0,
                // ),
                Text(
                  'New Ticket Request',
                  // style: Theme.of(context)
                  //     .textTheme
                  //     .subtitle
                  //     .copyWith(color: Colors.white),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                // Icon(
                //   CupertinoIcons.ellipsis,
                //   color: Colors.white,
                // ),
              ],
            ),
          ),

          Container(
            // height: MediaQuery.of(context).size.height / 1.8,
            height: 550,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: PageView(
                    controller: _pageController,
                    children: <Widget>[
                      buildTicket(),
                      buildTicket(),
                      buildTicket(),
                      buildTicket(),
                      buildTicket(),
                      // PageViewCard(),
                      // PageViewCard(),
                      // PageViewCard(),
                      // PageViewCard(),
                      // PageViewCard(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: TrackingLines(
                      length: 5,
                      currentIndex: _currentIndex,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // buildTicket(),

          buildMenu(context),
          /* Visibility(
            visible: _sResultVisibility,
            child: Padding(
              // padding: const EdgeInsets.only(bottom: 15.0, top: 10),
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  // Container(
                  //   width: 7.0,
                  //   height: 7.0,
                  //   decoration: BoxDecoration(
                  //     color: Color(0xFFB42827),
                  //     borderRadius: BorderRadius.circular(5.0),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 8.0,
                  // ),
                  Text(
                    'Scan Result',
                    // style: Theme.of(context)
                    //     .textTheme
                    //     .subtitle
                    //     .copyWith(color: Colors.white),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  // Icon(
                  //   CupertinoIcons.ellipsis,
                  //   color: Colors.white,
                  // ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: _sResultVisibility,
            child: Padding(
              padding: EdgeInsets.only(top: 15),
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
                        content: _assetNumber,
                        biggerContent: true,
                      ),
                      PageViewCardListTile(
                          title: 'Asset Name', content: _assetName),
                      PageViewCardListTile(
                          title: 'Buy Date', content: _buyDate),
                      PageViewCardListTile(title: 'Brand', content: _brandName),
                      PageViewCardListTile(
                          title: 'Category', content: _categoryName),
                      PageViewCardListTile(title: 'User', content: _userName),
                      PageViewCardListTile(
                          title: 'User NRP', content: _userNrp),
                      PageViewCardListTile(
                          title: 'User Department', content: _userDepartment),
                      PageViewCardListTile(
                          title: 'Status', content: _statusName),
                      PageViewCardListTile(title: 'Room', content: _roomName),
                      PageViewCardListTile(
                        title: 'Location',
                        content: _locName,
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

          buildMenu2(context), */
        ],
      ),
    ));
  }

  Widget buildTicket() {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 15, right: 15),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  PageViewCardListTile(
                    title: 'Ticket ID',
                    content: '6969',
                    biggerContent: true,
                  ),
                  PageViewCardListTile(
                      title: 'Subject', content: 'No Internet Connection'),
                  PageViewCardListTile(
                      title: 'Reported By',
                      content: '1341180078 / Muhammad Akbar Hidayatullah'),
                  PageViewCardListTile(
                      title: 'Department', content: 'IT Function'),
                  PageViewCardListTile(
                      title: 'Email', content: 'muhammad.akbar@patria.co.id'),
                  PageViewCardListTile(
                      title: 'Asset Name', content: 'Personal Computer'),
                  PageViewCardListTile(
                      title: 'Message',
                      content: 'Please help me to fix my internet connection'),
                  PageViewCardListTile(
                      title: 'Priority', content: 'Very Urgent'),
                  PageViewCardListTile(
                      title: 'Ticket Submit By',
                      content: '1341180078 / Muhammad Akbar Hidayatullah'),
                  PageViewCardListTile(title: 'Note', content: _nA),
                  PageViewCardListTile(
                    title: 'Report Date',
                    content: '2020-01-19 18:00:00',
                  ),
                  PageViewCardListTile(
                    title: 'Respond Time',
                    content: _nA,
                  ),
                  PageViewCardListTile(
                    title: 'Resolve Time',
                    content: _nA,
                  ),
                  PageViewCardListTile(
                    title: 'Status',
                    content: 'Waiting',
                  ),
                ],
              )
            ],
          ),
        ),
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
                  // mainAxisSpacing: 2.0,
                  // crossAxisSpacing: 2.0,
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

  Widget buildMenu2(BuildContext context) {
    Widget child;

    child = Container(
      margin: EdgeInsets.only(top: 15),
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
                    // _buildGridMenuButton(0, 'Request', context),
                    // _buildGridMenuButton(1, 'Response', context),
                    // _buildGridMenuButton(2, 'Assets', context),
                    _buildGridMenuButton(3, 'Inventory', context),
                    _buildGridMenuButton(3, 'Inventory', context),
                    _buildGridMenuButton(3, 'Inventory', context),
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

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() => _currentIndex = _pageController.page.round());
    });

    super.initState();
    // _scanResult = 'Please Scan';
    _scanResult = 'Please Scan';
    // getTicket();

    // _assetName = '';
    // _assetNumber = '';
    // _buyDate = '';
    // _brandName = '';
    // _departmentName = '';
    // _sResultVisibility = false;

    // _loadPreferences();
  }

  void logoutOperation() async {
    debugPrint('------------- Starting Logout Operation -------------');
    debugPrint('# Clearing Profile Data');
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    debugPrint('# Navigate to Login Screen');

    Navigator.pushReplacementNamed(context, '/login');
    debugPrint('------------- Logout Operation Success-------------');
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

  void getTicket() async {
    try {
      Response response =
          await Dio().get("http://10.2.49.12/it_is/Api/getLastTicket/");
      // final getData = GetData.fromJson(response.data[0]);
      // final getData = GetTicket.fromJson(response.data);

      // print(response.data[0]["tiket_id"]);
      // print(response.data.length);

      String receivedJson = response.data;

      List mylist = List();

      for (var i = 0; i < response.data.length; i++) {
        // print(response.data[i]["subject"]);
        // print(GetTicket.fromJson(response.data[i]).assetName);
        print(GetTicket.fromJson(response.data[i]).assetName);
      }
    } catch (e) {
      print(e);
    }
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
          .get("http://10.2.49.12/it_is/Api/scanAsset/" + barcodeScan);
      // final getData = GetData.fromJson(response.data[0]);
      final getData = GetData.fromJson(response.data);

      /*     setState(() {
        _assetNumber =
            getData.assetNumber.isNotEmpty ? getData.assetNumber : _nA;
        _assetName = getData.assetName.isNotEmpty ? getData.assetName : _nA;
        _buyDate = getData.assetDateBuyed.toString().isNotEmpty
            ? getData.assetDateBuyed.toString()
            : _nA;
        _brandName = getData.brandName != null ? getData.brandName : _nA;
      }); */

      setState(() {
        _sResultVisibility = true;
        // _scanResult = response.data.toString();
        _assetNumber = getData.assetNumber != null ? getData.assetNumber : _nA;
        _assetName = getData.assetName != null ? getData.assetName : _nA;
        _buyDate = getData.assetDateBuyed.toString() != null
            ? getData.assetDateBuyed.toString()
            : _nA;
        _brandName = getData.brandName != null ? getData.brandName : _nA;
        _categoryName =
            getData.assetCategoryName != null ? getData.assetCategoryName : _nA;
        _categoryNumber = getData.assetCategoryNumber != null
            ? getData.assetCategoryNumber
            : _nA;
        _userName = getData.userName != null ? getData.userName : _nA;
        _userNrp = getData.userNrp != null ? getData.userNrp : _nA;
        _userDepartment = getData.userDept != null ? getData.userDept : _nA;
        _statusName = getData.statusName != null ? getData.statusName : _nA;
        _roomName = getData.roomName != null ? getData.roomName : _nA;
        _locName = getData.locName != null ? getData.locName : _nA;
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

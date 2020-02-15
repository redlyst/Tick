import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'DetailScreen.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController controller = new TextEditingController();
  String filter;
  List names = new List();
  List filteredNames = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Ticket Request');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          controller: controller,
          decoration: new InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.white),
              // prefixIcon: new Icon(Icons.search),
              hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Ticket Request');
        filteredNames = names;
        controller.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: TextField(
        // autofocus: true,
        // style: TextStyle(color: Colors.white),
        // controller: controller,
        // decoration: new InputDecoration(
        //     border: InputBorder.none,
        //     hintStyle: TextStyle(color: Colors.white),
        //     // prefixIcon: new Icon(Icons.search),
        //     hintText: 'Search by SN or CN ...'),
        // ),
        // actions: <Widget>[
        //   IconButton(
        //       icon: Icon(Icons.close),
        //       onPressed: () {
        //         controller.clear();
        //       })
        // ],

        actions: <Widget>[
          IconButton(
              icon: _searchIcon,
              onPressed: () {
                _searchPressed();
              })
        ],
        title: _appBarTitle,
      ),
      body: SafeArea(
        child: FutureBuilder<List>(
          future: getList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                    itemBuilder: (context, i) {
                      return filter == null || filter == ""
                          ? Container(
                              // // padding: const EdgeInsets.all(10.0),
                              child: new GestureDetector(
                                // onTap: () => Navigator.of(context).push(
                                //     new MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //             ConfirmPDetail(
                                //               list: snapshot.data,
                                //               index: i,
                                //             ))),
                                child: new Card(
                                  // margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                                  // elevation: 0.5,
                                  child: new ListTile(
                                    // contentPadding: EdgeInsets.all(10),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      verticalDirection: VerticalDirection.up,
                                      children: <Widget>[
                                        Text(snapshot.data[i]['reporter_name']),
                                        Text(
                                          snapshot.data[i]['message'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          // : snapshot.data[i]['person_sales']
                          //             .toLowerCase()
                          //             .contains(filter.toLowerCase()) ||
                          //         snapshot.data[i]['person_marketing']
                          //             .toLowerCase()
                          //             .contains(filter.toLowerCase())
                          : snapshot.data[i]['reporter_nrp']
                                      .toString()
                                      .toLowerCase()
                                      .contains(filter.toLowerCase()) ||
                                  snapshot.data[i]['reporter_name']
                                      .toString()
                                      .toLowerCase()
                                      .contains(filter.toLowerCase())
                              ? Container(
                                  // padding: const EdgeInsets.all(10.0),
                                  child: new GestureDetector(
                                    /*  onTap: () => Navigator.of(context).push(
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                new DetailScreen(
                                                  list: snapshot.data,
                                                  index: i,
                                                ))), */
                                    // onTap: () => Navigator.of(context).push(
                                    //     new MaterialPageRoute(
                                    //         builder: (BuildContext context) =>
                                    //             ConfirmPDetail(
                                    //               list: snapshot.data,
                                    //               index: i,
                                    //             ))),
                                    child: new Card(
                                      margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                      elevation: 0.5,
                                      child: new ListTile(
                                          title: Column(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(bottom: 5),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  // child: Container(
                                                  // padding: EdgeInsets.all(15),
                                                  // padding: EdgeInsets.only(
                                                  //     left: 20,
                                                  //     right: 15,
                                                  //     top: 15,
                                                  //     bottom: 15),
                                                  // color: Colors.yellow,
                                                  child: Text(
                                                    'NRP',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  // ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                      // padding: EdgeInsets.all(15),
                                                      // color: Colors.green,
                                                      child: Text(snapshot
                                                              .data[i][
                                                          'reporter_nrp'
                                                              .toLowerCase()])),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  // child:
                                                  // Container(
                                                  // padding: EdgeInsets.all(15),
                                                  // padding: EdgeInsets.only(
                                                  //     left: 20,
                                                  //     right: 15,
                                                  //     top: 15,
                                                  //     bottom: 15),
                                                  // color: Colors.yellow,
                                                  child: Text(
                                                    'Name',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  // ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    // padding: EdgeInsets.all(15),
                                                    // color: Colors.green,
                                                    child: Text(snapshot.data[i]
                                                                [
                                                                'reporter_name'] !=
                                                            null
                                                        ? snapshot.data[i][
                                                            'reporter_name'
                                                                .toLowerCase()]
                                                        : 'Not Available'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                          //     title: Column(
                                          //   crossAxisAlignment:
                                          //       CrossAxisAlignment.start,
                                          //   children: <Widget>[
                                          //     new Text(snapshot.data[i]
                                          //         ['sn'.toLowerCase()]),
                                          //     snapshot.data[i]['chasisnumber'] !=
                                          //             null
                                          //         ? Text(snapshot.data[i][
                                          //             'chasisnumber'.toLowerCase()])
                                          //         : Text(
                                          //             'Not Available',
                                          //             style: TextStyle(
                                          //                 color: Colors.red),
                                          //           ),

                                          //     // Text(snapshot.data[i]['chasisnumber'.toLowerCase()]),
                                          //   ],
                                          // )
                                          // leading: new Icon(Icons.widgets),
                                          ),
                                    ),
                                  ),
                                )
                              : Container();
                    },
                  )
                : new Center(
                    child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: CircularProgressIndicator(),
                        ),
                        Text('Fetching data, please wait ...')
                      ],
                    ),
                  ));
          },
        ),
      ),
    );
  }

  Future<List> getList() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String urlPage = prefs.getString("IPServer") != null
    //     ? prefs.getString("IPServer") + "/integrasi/Api/allSN"
    //     : "http://10.48.10.116/integrasi/Api/allSN";

    var dio = Dio();
    Response response = await dio.get("http://10.2.49.12/it_is/Api/getUsers");
    // Response response = await dio.get(
    //     prefs.getString("IPServer"+"/integrasi/Api/allSN") ?? "http://10.48.10.116/integrasi/Api/allSN");
    // Response response = await dio.get(prefs.getString('APIList'));

    // Response response = await dio.get(urlPage);

    // debugPrint(prefs.getString('IPServer'));
    return response.data;
  }
}

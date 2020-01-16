import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// void main() => runApp(MyApp());

GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//           // primaryColor: Color(0xFF7D9AFF),
//           // accentColor: Color(0xFF7D9AFF),
//           primaryColor: Colors.red,
//           accentColor: Colors.redAccent),
//       home: LoginScreen(),
//     );
//   }
// }

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                color: Color.fromRGBO(122, 163, 255, 1),
                height: 50,
                width: mediaQuery.size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Need help?",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      width: 5,
                    ),
                    Text(
                      "CONTACT US!",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
              // IconButton(
              //   icon: Icon(Icons.menu),
              //   onPressed: () {},
              // ),
              // IconButton(
              //   icon: Icon(Icons.search),
              //   onPressed: () {},
              // ),
            ],
          ),
        ),
        // backgroundColor: Color(0xff232833),
        backgroundColor: Color(0xffffffff),
        resizeToAvoidBottomPadding: false,
        key: scaffoldState,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              // if (constraints.maxWidth < 1000) {
              //   return Center(
              //       child: ListView(
              //     children: <Widget>[
              //       Container(
              //         color: Colors.red,
              //         width: constraints.maxWidth / 4,
              //         height: constraints.maxWidth / 4,
              //       )
              //     ],
              //   ));
              // } else {
              //   return SingleChildScrollView(
              //     child: FlatButton(
              //       child: Text('MaxWidth'),
              //       onPressed: () {
              //         print(mediaQuery.size.width);
              //         print(mediaQuery.size.height);
              //         print(constraints.maxWidth);
              //         print(constraints.maxHeight);
              //       },
              //     ),
              //   );
              // }
              // return SingleChildScrollView(
              //     child:
              //         // Stack(
              //         // overflow: Overflow.clip,
              //         // alignment: AlignmentDirectional.center,
              //         // children: <Widget>[
              //         //       Container(
              //         // width: mediaQuery.size.width,
              //         // height: mediaQuery.size.height,
              //         // child:
              //         // Column(
              //         // children: <Widget>[
              //         Stack(
              //   fit: StackFit.expand,
              //   children: <Widget>[
              //     Container(
              //       color: Colors.red,
              //     )
              //     // Positioned(
              //     //   top: 10,
              //     //   child: Text("WASDWASD"),
              //     // ),
              //     // Positioned(
              //     //   top: 20,
              //     //   child: Text('QWERTQWERT'),
              //     // ),
              //   ],
              //   // ),
              //   // Stack(
              //   //   children: <Widget>[Text('QWERTQWERT')],
              //   // )

              return Column(
                children: <Widget>[
                  _loginImageBackground(mediaQuery),
                  _loginForm(mediaQuery, context)
                ],
              );
              //   // _loginImageBackground(mediaQuery),
              //   // _loginForm(mediaQuery, context)
              //   // ],
              //   // ),
              // ));
            },
          ),
        ));
  }
}

Widget _loginImageBackground(MediaQueryData mediaQuery) {
  return Flexible(
      fit: FlexFit.tight,
      flex: 2,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Positioned(
            child:
                //  Hero(
                //   tag: 'login',
                //   child:
                Container(
              width: double.infinity,
              // height: mediaQuery.size.height / 1.7,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(50.0),
                //   bottomRight: Radius.circular(50.0),
                // ),
                image: DecorationImage(
                  image: AssetImage('images/5204985.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // ),
          ),
          Positioned(
            child: Text(
              'Ticketing System',
              style: TextStyle(
                shadows: [
                  Shadow(
                    blurRadius: 1.0,
                    color: Colors.white,
                    offset: Offset(1.0, 2.0),
                  ),
                ],
                color: Color.fromRGBO(64, 122, 255, 1),
                fontFamily: 'CoralPen',
                fontSize: 82.0,
              ),
            ),
            top: mediaQuery.size.height / 3.6,
            // top: constraints.maxHeight - 100.0,
          ),

          // Container(
          //   margin: EdgeInsets.only(bottom: 20),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Text(
          //         'Login to your account',
          //         style: TextStyle(
          //           color: Colors.black,
          //           fontWeight: FontWeight.w600,
          //           fontSize: 24.0,
          //           fontFamily: 'Campton_Light',
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // Positioned(
          //   child: Text(
          //     'Welcome to',
          //     style: TextStyle(
          //       shadows: [
          //         Shadow(
          //           blurRadius: 10.0,
          //           color: Colors.black,
          //           offset: Offset(5.0, 5.0),
          //         ),
          //       ],
          //       color: Colors.white,
          //       fontFamily: 'CoralPen',
          //       fontSize: 72.0,
          //     ),
          //   ),
          //   top: mediaQuery.size.height / 16,
          //   // top: constraints.maxHeight - 140.0,
          // )
        ],
      ));
}

Widget _loginForm(MediaQueryData mediaQuery, BuildContext context) {
  return Flexible(
    fit: FlexFit.tight,
    flex: 2,
    child: Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: mediaQuery.size.width,
      // height: 50,
      // color: Colors.red,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Login to your account',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 24.0,
                    fontFamily: 'Campton_Light',
                  ),
                )
              ],
            ),
          ),
          TextFormField(
            // cursorColor: Colors.white,
            // style: TextStyle(color: Colors.white),
            autofocus: false,
            decoration: InputDecoration(
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(122, 163, 255, 1),
                      width: 1.0,
                      style: BorderStyle.solid),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(122, 163, 255, 1),
                      width: 1.0,
                      style: BorderStyle.solid),
                ),
                // fillColor: Color(0xff2e323e),
                prefixIcon: Icon(
                  Icons.account_circle,
                  // color: Color(0xff83888f)),

                  color: Color.fromRGBO(122, 163, 255, 1),
                ),
                labelText: 'NRP',
                labelStyle: TextStyle(color: Color(0xff83888f)),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff2e323e)))),
          ),
          Divider(),
          TextFormField(
            // style: TextStyle(color: Colors.white),
            obscureText: true,
            autofocus: false,
            decoration: InputDecoration(
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(122, 163, 255, 1),
                      width: 1.0,
                      style: BorderStyle.solid),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(122, 163, 255, 1),
                      width: 1.0,
                      style: BorderStyle.solid),
                ),
                // fillColor: Color(0xff2e323e),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Color.fromRGBO(122, 163, 255, 1),
                ),
                labelText: 'Password',
                labelStyle: TextStyle(color: Color(0xff83888f)),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder()),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            // child: Material(
            //   // color: Color(0xff1e2129),
            //   color: Color.fromRGBO(64, 122, 255, 1),
            //   borderRadius: BorderRadius.circular(5.0),
            //   // shadowColor: Colors.lightBlueAccent.shade100,
            //   // elevation: 5.0,
            child: FlatButton(
                padding: EdgeInsets.all(10),
                // minWidth: 200.0,
                // height: 42.0,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                color: Color.fromRGBO(64, 122, 255, 1),
                child: Container(
                  // width: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Sign In', style: TextStyle(color: Colors.white)),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      )
                    ],
                  ),
                )),
            // ),
          )
        ],
      ),
    ),
  );
}

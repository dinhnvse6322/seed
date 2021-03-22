import 'package:authentification/repositories/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DettailPage extends StatefulWidget {
  static String id = 'book_detail_screen';
  List list;
  int index;

  DettailPage({this.index, this.list});

  @override
  _DettailPageScreennState createState() => _DettailPageScreennState();
}

class _DettailPageScreennState extends State<DettailPage> {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#EAEAE3"),
      body: SafeArea(
          child: Container(
        color: HexColor("#EAEAE3"),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                // Image.network(
                //   "${widget.list[widget.index]['imageUrl']}",
                //   height: 350,
                //   width: 500,
                //   fit: BoxFit.fitWidth,
                // ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        // Box decoration takes a gradient
                        gradient: LinearGradient(
                          // Where the linear gradient begins and ends
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          // Add one stop for each color. Stops should increase from 0 to 1
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.07),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.025),
                          ],
                        ),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container())),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.orange,
                              size: 40,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            })),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: <Widget>[
                    //     Padding(
                    //       padding: const EdgeInsets.all(10),
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(10.0),
                    //         child: IconButton(),
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
                Positioned(
                    bottom: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    )),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'ID:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '${widget.list[widget.index]['id']}',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Title:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '${widget.list[widget.index]['titleProject']}',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Project name:',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontFamily: 'montserrat',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '${widget.list[widget.index]['projectName']}',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontFamily: 'montserrat',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Seed Id:',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontFamily: 'montserrat',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '${widget.list[widget.index]['seedId']}',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontFamily: 'montserrat',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Capital:',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontFamily: 'montserrat',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '${widget.list[widget.index]['capital']}',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontFamily: 'montserrat',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        '${widget.list[widget.index]['des']}',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120, left: 30),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

import 'dart:ui';

// import 'package:book_project/models/DatabaseHelper.dart';
// import 'package:book_project/screens/add_book_screen.dart';
// import 'package:book_project/screens/search_screen.dart';
import 'package:authentification/DetailPage.dart';
import 'package:authentification/repositories/api.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:shared_preferences/shared_preferences.dart';

// import 'book_detail_screen.dart';
// import 'login_screen.dart';

class DashBoard extends StatefulWidget {
  static const String id = 'home_screen';

  DashBoard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final Color primary = Colors.black54;
  final Color active = Colors.white;
  DatabaseHelper databaseHelper = new DatabaseHelper();
  final TextEditingController _searchcontroller = new TextEditingController();

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(_onScroll);
    // _postBloc = context.read<AlbumBloc>();
  }

  // void _onScroll() {
  //   if (_isBottom) _postBloc.add(PostFetched());
  // }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  // _save(String token) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'token';
  //   final value = token;
  //   prefs.setString(key, value);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      key: _key,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          child: Row(
            children: <Widget>[
              Text(
                "X ",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.orange),
              ),
              Text(
                "Groceries",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.orange),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                // Navigator.of(context).push(new MaterialPageRoute(
                //   builder: (BuildContext context) => new SearchList(),
                // ));
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      body: FutureBuilder<List>(
        future: databaseHelper.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(list: snapshot.data)
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ItemList extends StatelessWidget {
  List list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#EAEAE3"),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: list == null ? 0 : list.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        return new Container(
                          padding: const EdgeInsets.all(10.0),
                          child: new GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new DettailPage(
                                        list: list,
                                        index: i,
                                      )),
                            ),
                            child: InkWell(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    // Hero(
                                    //   tag: list[i]['id'],
                                    //   child: Container(
                                    //     width: 70,
                                    //     height: 120,
                                    //     decoration: BoxDecoration(
                                    //         borderRadius: BorderRadius.all(
                                    //             Radius.circular(7)),
                                    //         image: DecorationImage(
                                    //             image: NetworkImage(
                                    //                 list[i]['url']),
                                    //             fit: BoxFit.cover)),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 260,
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            '${list[i]['projectName']} ',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '  Title: ${list[i]['titleProject']} ',
                                          style: TextStyle(
                                              fontFamily: 'montserrat',
                                              color: Colors.black87,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 300,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                '  Capital ${list[i]['capital']} ',
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:nature_landing_page/constants/strings.dart';
import 'package:nature_landing_page/widgets/bottom_bar.dart';
import 'package:nature_landing_page/widgets/carousel.dart';
import 'package:nature_landing_page/widgets/featured_heading.dart';
import 'package:nature_landing_page/widgets/featured_tiles.dart';
import 'package:nature_landing_page/widgets/floating_quick_access_bar.dart';
import 'package:nature_landing_page/widgets/web_scrollbar.dart';
import 'package:nature_landing_page/widgets/destination_heading.dart';
//import 'package:nature_landing_page/widgets/carousel.dart';

import '../widgets/auth_dialog.dart';
import '../widgets/tools/authentication.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;
  List _isHovering = [false, false, false, false];
  bool _isProcessing = false;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    //print(Size(screenSize.width, screenSize.height));
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        extendBodyBehindAppBar: false,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 100),
          child: Container(
            color: const Color(0xFF1B1D1B).withOpacity(0.7),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    strNameApp,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueGrey[100],
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 3,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: screenSize.width / 8),
                        InkWell(
                          onHover: (value) {
                            setState(() {
                              //print(value);
                              _isHovering[0] = value ? true : false;
                            });
                          },
                          onTap: () {},
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Text(
                              strMenuItem1,
                              style: TextStyle(
                                color: _isHovering[0]
                                    ? Colors.blue[200]
                                    : Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            // For showing an underline on hover
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[0],
                              child: Container(
                                height: 2,
                                width: 40,
                                color: Colors.white,
                              ),
                            )
                          ]),
                        ),
                        SizedBox(width: screenSize.width / 20),
                        InkWell(
                          onHover: (value) {
                            setState(() {
                              _isHovering[1] = value ? true : false;
                            });
                          },
                          onTap: () {},
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  strMenuItem2,
                                  style: TextStyle(
                                    color: _isHovering[1]
                                        ? Colors.blue[100]
                                        : Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5),
                                // For showing an underline on hover
                                Visibility(
                                  maintainAnimation: true,
                                  maintainState: true,
                                  maintainSize: true,
                                  visible: _isHovering[1],
                                  child: Container(
                                    height: 2,
                                    width: 40,
                                    color: Colors.white,
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  //button theme switch
                  IconButton(
                    icon: Icon(Icons.brightness_6),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    color: Colors.white,
                    onPressed: () {
                      DynamicTheme.of(context).setBrightness(
                          Theme.of(context).brightness == Brightness.dark
                              ? Brightness.light
                              : Brightness.dark);
                    },
                  ),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[3] = true : _isHovering[3] = false;
                      });
                    },
                    onTap: userEmail == null
                        ? () {
                            showDialog(
                              context: context,
                              builder: (context) => AuthDialog(),
                            );
                          }
                        : null,
                    child: userEmail == null
                        ? Text(
                            'Sign in',
                            style: TextStyle(
                              color: _isHovering[3]
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                          )
                        : Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundImage: imageUrl != null
                                    ? NetworkImage(imageUrl)
                                    : null,
                                child: imageUrl == null
                                    ? Icon(
                                        Icons.account_circle,
                                        size: 30,
                                      )
                                    : Container(),
                              ),
                              SizedBox(width: 5),
                              Text(
                                name ?? userEmail,
                                style: TextStyle(
                                  color: _isHovering[3]
                                      ? Colors.white
                                      : Colors.white70,
                                ),
                              ),
                              SizedBox(width: 10),
                              FlatButton(
                                color: Colors.blueGrey,
                                hoverColor: Colors.blueGrey[700],
                                highlightColor: Colors.blueGrey[800],
                                onPressed: _isProcessing
                                    ? null
                                    : () async {
                                        setState(() {
                                          _isProcessing = true;
                                        });
                                        await signOut().then((result) {
                                          print(result);
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              fullscreenDialog: true,
                                              builder: (context) => HomePage(),
                                            ),
                                          );
                                        }).catchError((error) {
                                          print('Sign Out Error: $error');
                                        });
                                        setState(() {
                                          _isProcessing = false;
                                        });
                                      },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 8.0,
                                    bottom: 8.0,
                                  ),
                                  child: _isProcessing
                                      ? CircularProgressIndicator()
                                      : Text(
                                          'Sign out',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                ),
                              )
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: WebScrollbar(
          color: Colors.blueGrey,
          backgroundColor: Colors.blueGrey.withOpacity(0.3),
          width: 10,
          heightFraction: 0.3,
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                //DestinationHeading(screenSize: screenSize),
                DestinationCarousel(),
                SizedBox(
                  height: 40,
                ),
                Stack(
                  children: [
                    Container(
                      // image below the top bar
                      child: SizedBox(
                        height: screenSize.height * 0.45,
                        width: screenSize.width,
                        child: Image.asset(
                          'assets/images/cover.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //DestinationCarousel(),
                    Column(children: [
                      FloatingQuickAccessBar(screenSize: screenSize),
                      Container(
                        child: Column(
                          children: [
                            FeaturedHeading(
                              screenSize: screenSize,
                            ),
                            FeaturedTiles(screenSize: screenSize)
                          ],
                        ),
                      )
                    ]),
                  ],
                ),
                //DestinationHeading(screenSize: screenSize),
                //DestinationCarousel(),
                SizedBox(height: screenSize.height / 10),
                BottomBar(),
              ],
            ),
          ),
        ));
  }
}

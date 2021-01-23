import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nature_landing_page/constants/strings.dart';
import 'package:nature_landing_page/widgets/bottom_bar_column.dart';
import 'package:nature_landing_page/widgets/info_text.dart';
import 'package:nature_landing_page/widgets/responsive.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(),
      padding: EdgeInsets.all(30),
      color: Theme.of(context).bottomAppBarColor,
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //falta asignar las URL y _isHovering
                  children: [
                    BottomBarColumn(
                      heading: strAbout,
                      s1: strContactUs,
                      s2: strAboutUs,
                      s3: strAboutUs,
                    ),
                    BottomBarColumn(
                      heading: strHelp,
                      s1: strPayment,
                      s2: strReservation,
                      s3: strFAQ,
                    ),
                    BottomBarColumn(
                      heading: strDocument,
                      s1: strDocument1,
                      s2: strDocument2,
                      s3: strDocument3,
                    ),
                  ],
                ),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InfoText(
                      type: 'REDES SOCIALES',
                      text: '',
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.twitterSquare),
                          tooltip: strChanel1,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.facebookSquare),
                          tooltip: strChanel2,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.instagramSquare),
                          tooltip: strChanel3,
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
                InfoText(
                  type: 'Correo',
                  text: strEmail,
                ),
                SizedBox(height: 5),
                InfoText(
                  type: 'Dirección',
                  text: strAddress1,
                ),
                InfoText(
                  type: '',
                  text: strAddress2,
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                SizedBox(height: 20),
                Text(
                  'Copyright © 2021 | CANAIMA',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: strAbout,
                      s1: strContactUs,
                      s2: strAboutUs,
                      s3: strAboutUs,
                    ),
                    BottomBarColumn(
                      heading: strHelp,
                      s1: strPayment,
                      s2: strReservation,
                      s3: strFAQ,
                    ),
                    BottomBarColumn(
                      heading: strDocument,
                      s1: strDocument1,
                      s2: strDocument2,
                      s3: strDocument3,
                    ),
                    Container(
                      color: Colors.blueGrey,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: <Widget>[
                            Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                //crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InfoText(
                                    type: 'REDES SOCIALES',
                                    text: '',
                                  ),
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: const Icon(
                                            FontAwesomeIcons.twitterSquare),
                                        tooltip: strChanel1,
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                            FontAwesomeIcons.facebookSquare),
                                        tooltip: strChanel2,
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                            FontAwesomeIcons.instagramSquare),
                                        tooltip: strChanel3,
                                        onPressed: () {},
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoText(
                          type: 'Correo',
                          text: strEmail,
                        ),
                        SizedBox(height: 5),
                        InfoText(
                          type: 'Dirección',
                          text: strAddress1,
                        ),
                        InfoText(
                          type: '',
                          text: strAddress2,
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blueGrey,
                    width: double.maxFinite,
                    height: 1,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Text(
                    'Copyright © 2021 | CANAIMA',
                    style: TextStyle(
                      color: Colors.blueGrey[300],
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

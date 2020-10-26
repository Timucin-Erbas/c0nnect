import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/painting.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactPage extends StatefulWidget {
  final heroTag;
  final contactName;
  final contactBiography;

  ContactPage({this.heroTag, this.contactName, this.contactBiography});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.black,
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RaisedButton.icon(
                        onPressed: _showFriendSettingsSheet,
                        icon: Icon(Icons.directions_run),
                        color: Colors.grey.shade100,
                        label: Text(
                          "Actions",
                          style: TextStyle(color: Colors.black),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    ),
                  ],
                ),
                sizedBox,
                CircleAvatar(
                  backgroundImage: AssetImage(widget.heroTag),
                  radius: 100.0,
                ),
                sizedBox,
                Text(
                  widget.contactName,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 40.0),
                ),
                Text(widget.contactBiography,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                      decoration: TextDecoration.underline,
                    )),
                sizedBox,
                sizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 25.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Message",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                sizedBox,
                sizedBox,
              ],
            ),
            bottomsheet(),
          ],
        ));
  }

  void _showFriendSettingsSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0))),
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: Colors.green,
                            child: ListTile(
                              onTap: () {
                                //open edit profile
                              },
                              title: Text(
                                "Rate your Friendship",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              leading: CircleAvatar(
                                backgroundImage:
                                AssetImage("assets/images/HenriKlein.jpeg"),
                              ),
                              trailing: Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Card(
                            elevation: 4.0,
                            margin: const EdgeInsets.fromLTRB(
                                32.0, 8.0, 32.0, 16.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(
                                    Icons.people_outline,
                                    color: Colors.lightGreen,
                                  ),
                                  title: Text("Invite to event"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {},
                                ),
                                sizedBox,
                                ListTile(
                                  leading: Icon(
                                    Icons.directions_run,
                                    color: Colors.lightGreen,
                                  ),
                                  title: Text("Challange Henri"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {},
                                ),
                                sizedBox,
                                ListTile(
                                  leading: Icon(
                                    Icons.phone_iphone,
                                    color: Colors.lightGreen,
                                  ),
                                  title: Text("Text/Call Henri"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {},
                                ),
                                sizedBox,
                                ListTile(
                                  leading: Icon(
                                    Icons.lock_outline,
                                    color: Colors.lightGreen,
                                  ),
                                  title: Text("Delete Friend"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Center(
                            child: Text(
                              "Friens since 09/20/2019",
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            height: 40.0,
                            child: GestureDetector(
                              onTap: () {},
                              child: Material(
                                borderRadius: BorderRadius.circular(50.0),
                                shadowColor: Colors.black,
                                color: Colors.green,
                                elevation: 7.0,
                                child: Center(
                                  child: Text(
                                    '27 mutural friends', //Login Button
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}

final sizedBox = SizedBox(
  height: 10.0,
);
final sizedboxWidth = SizedBox(
  width: 8.0,
);
final BorderRadius radius = BorderRadius.circular(15.0);
final BorderRadius bottomsheetRadius = BorderRadius.only(
    topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0));

class bottomsheet extends StatefulWidget {
  @override
  _bottomsheetState createState() => _bottomsheetState();
}

class _bottomsheetState extends State<bottomsheet> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 10;
    double height = MediaQuery.of(context).size.height - 10;
    return Stack(
      children: <Widget>[
        FriendsAboutSheet(height: height),
        TimeLineSheet(height: height),
      ],
    );
  }
}

class FriendsAboutSheet extends StatefulWidget {
  const FriendsAboutSheet({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  _FriendsAboutSheetState createState() => _FriendsAboutSheetState();
}

class _FriendsAboutSheetState extends State<FriendsAboutSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        maxChildSize: 1.0,
        minChildSize: 0.24,
        initialChildSize: 0.24,
        builder: (context, scrollableController) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: scrollableController,
            child: Container(
                height: widget.height,
                decoration: BoxDecoration(
                  borderRadius: bottomsheetRadius,
                  color: Colors.blueGrey.shade50,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      ResponsiveContainer(
                        widthPercent: 25.0,
                        heightPercent: 1.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("About",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 30.0)),
                            Icon(
                              Icons.arrow_upward,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircularProfileAvatar(
                            "",
                            backgroundColor: Colors.grey.shade300,
                            elevation: 5.0,
                            radius: 30.0,
                            child: Center(
                              child: RaisedButton(
                                onPressed: () async {
                                  const url = 'https://facebook.com/klnHenri';

                                  if (await canLaunch(url)) {
                                    await launch(url, forceSafariVC: false);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.indigo,
                                ),
                              ),
                            ),
                          ),
                          CircularProfileAvatar(
                            "",
                            backgroundColor: Colors.grey.shade300,
                            elevation: 5.0,
                            radius: 30.0,
                            child: Center(
                              child: RaisedButton(
                                onPressed: () async {
                                  const url = 'https://instagram.com/klnHenri';

                                  if (await canLaunch(url)) {
                                    await launch(url, forceSafariVC: false);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: Color(0xFFE1306C),
                                ),
                              ),
                            ),
                          ),
                          CircularProfileAvatar(
                            "",
                            backgroundColor: Colors.grey.shade300,
                            elevation: 5.0,
                            radius: 30.0,
                            child: Center(
                              child: RaisedButton(
                                onPressed: () async {
                                  const url = 'https://twitter.com/klnHenri';

                                  if (await canLaunch(url)) {
                                    await launch(url, forceSafariVC: false);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          CircularProfileAvatar(
                            "",
                            backgroundColor: Colors.grey.shade300,
                            elevation: 5.0,
                            radius: 30.0,
                            child: Center(
                              child: RaisedButton(
                                onPressed: () async {
                                  const url =
                                      'https://snapchat.com/add/klnHenri';

                                  if (await canLaunch(url)) {
                                    await launch(url, forceSafariVC: false);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: FaIcon(FontAwesomeIcons.snapchat,
                                    color: Colors.yellowAccent),
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedBox,
                      sizedBox,
                      Divider(
                        color: Colors.grey,
                        height: 4,
                        thickness: 0.5,
                      ),
                      sizedBox,
                      Text("Life is short. Break the rules.",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                          )),
                      sizedBox,
                      Divider(
                        color: Colors.grey,
                        height: 4,
                        thickness: 0.5,
                      ),
                      sizedBox,
                      Align(
                        alignment: Alignment.topLeft,
                      ),
                      sizedBox,
                      Card(
                        elevation: 4.0,
                        color: Colors.blueGrey.shade50,
                        margin:
                        const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(
                                Icons.phone,
                                color: Colors.lightGreen,
                              ),
                              title: Text("+49 0160 5812203"),
                              onTap: () {
                                //open change password
                              },
                            ),
                            sizedBox,
                            ListTile(
                              leading: Icon(
                                Icons.email,
                                color: Colors.lightGreen,
                              ),
                              title: Text("email@henriklein.de"),
                              onTap: () {
                                //open change language
                              },
                            ),
                            sizedBox,
                            ListTile(
                              leading: Icon(
                                Icons.cake,
                                color: Colors.lightGreen,
                              ),
                              title: Text("8th of December 2003"),
                              onTap: () {
                                //open change location
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.location_on,
                                color: Colors.lightGreen,
                              ),
                              title: Text("Bad Homburg, Germany"),
                              onTap: () {
                                //open change location
                              },
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 4.0,
                        color: Colors.blueGrey.shade50,
                        margin:
                        const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(
                                Icons.bubble_chart,
                                color: Colors.lightGreen,
                              ),
                              title:
                              Text("male, in a relation with his Computer"),
                              onTap: () {
                                //open change location
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.people,
                                color: Colors.lightGreen,
                              ),
                              title: Text("You got 26 mutural Friends"),
                              onTap: () {
                                //open change location
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}

class TimeLineSheet extends StatefulWidget {
  const TimeLineSheet({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  _TimeLineSheetState createState() => _TimeLineSheetState();
}

class _TimeLineSheetState extends State<TimeLineSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        maxChildSize: 1.0,
        minChildSize: 0.13,
        initialChildSize: 0.13,
        builder: (context, scrollableController) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: scrollableController,
            child: Container(
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: bottomsheetRadius,
                color: Color.fromRGBO(250, 250, 250, 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Center(
                        child: ResponsiveContainer(
                          widthPercent: 25.0,
                          heightPercent: 1.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.black54,
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("TimeLine",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 30.0,
                                  color: Colors.black)),
                          IconButton(
                              icon: Icon(
                                Icons.arrow_upward,
                                color: Colors.black,
                                size: 30.0,
                              ),
                              onPressed: () {})
                        ],
                      ),
                    ),
                    sizedBox,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 10.0,
                                child: Center(
                                  child: Text(
                                    ">",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              sizedboxWidth,
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    "Hang out",
                                    style: TextStyle(
                                        color: Colors.black12,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "Meet with Friends",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Anna, Vivien, Max, Tom",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "Friday, 6:30 PM",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    sizedBox,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 10.0,
                                child: Center(
                                  child: Text(
                                    ">",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              sizedboxWidth,
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    "Birthday (reminder)",
                                    style: TextStyle(
                                        color: Colors.black12,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "Jannes Birthday",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "08/12/2000",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "Wednessday",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    sizedBox,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 10.0,
                                child: Center(
                                  child: Text(
                                    "=",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              sizedboxWidth,
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    "Party at Joe's",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "Reason: exam week done",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Seedammstrasse 21",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "today, 6 PM",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    sizedBox,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 10.0,
                                child: Center(
                                  child: Text(
                                    "<",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              sizedboxWidth,
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    "Appointment",
                                    style: TextStyle(
                                        color: Colors.black12,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "Dr. Alfred IDK",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Frankfurter Landstrasse 21 ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "last Thursday",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 10.0,
                                child: Center(
                                  child: Text(
                                    "<",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              sizedboxWidth,
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    "Hang out",
                                    style: TextStyle(
                                        color: Colors.black12,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "Meet with Friends",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Some more random guys",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "March 28th",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 10.0,
                                child: Center(
                                  child: Text(
                                    "<",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              sizedboxWidth,
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    "Hang out",
                                    style: TextStyle(
                                        color: Colors.black12,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "Meet with Friends",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Some more random guys",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "March 28th",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 10.0,
                                child: Center(
                                  child: Text(
                                    "<",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              sizedboxWidth,
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    "Hang out",
                                    style: TextStyle(
                                        color: Colors.black12,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "Meet with Friends",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Some more random guys",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "March 28th",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

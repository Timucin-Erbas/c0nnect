import 'package:c0nnect/Setup/addInfo.dart' as addInfo;
import 'package:c0nnect/Setup/EditSocials.dart' as editSocials;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_animations/simple_animations.dart';

final sizedBox = SizedBox(
  height: 10.0,
);
final sizedBoxWidth = SizedBox(
  width: 8.0,
);
final BorderRadius radius = BorderRadius.circular(15.0);
final BorderRadius bottomSheetRadius = BorderRadius.only(
    topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0));

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double socialsSize = 30;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 10;
    double height = MediaQuery.of(context).size.height - 10;

    double iconDistance =
        (MediaQuery.of(context).size.width - (2 * 15) - (4 * 2 * 30)) / 3;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  leading: Icon(
                    Icons.notifications_active,
                    color: Colors.black,
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RaisedButton.icon(
                        onPressed: _showEditProfileSheet,
                        icon: Icon(Icons.edit),
                        color: Colors.grey.shade100,
                        label: Text(
                          "Settings",
                          style: TextStyle(color: Colors.black),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
                sizedBox,
                FutureBuilder(builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: Image.network(snapshot.data).image,
                        radius: 100.0,
                      );
                    } else {
                      //TODO add user picture
                      return CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/ProfilePicture.jpeg"),
                        radius: 100.0,
                      );
                    }
                  } else {
                    return CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/ProfilePicture.jpeg"),
                      radius: 100.0,
                    );
                  }
                }),
                sizedBox,
                Text(
                  'Henri Klein',
                  //Text('user',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 40.0),
                ),
                Text('work hard - play hard', // short description
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
                          // replace
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
            Stack(
              children: <Widget>[
                DraggableScrollableSheet(
                    maxChildSize: 1.0,
                    minChildSize: 0.24,
                    initialChildSize: 0.24,
                    builder: (context, scrollableController) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        controller: scrollableController,
                        child: Container(
                            height: height - 55,
                            decoration: BoxDecoration(
                              borderRadius: bottomSheetRadius,
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
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                  Container(
                                      // give a custom height
                                      color: Colors.blueGrey.shade50,
                                      height: 80,
                                      width: double.infinity,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: <Widget>[
                                          SizedBox(
                                            width: 10,
                                          ),
                                          GestureDetector(
                                              onTap: () async {},
                                              child: Center(
                                                  child: CircularProfileAvatar(
                                                '',
                                                backgroundColor:
                                                    Colors.grey.shade300,
                                                radius: socialsSize,
                                                elevation: 5,
                                                child: Center(
                                                  child: FaIcon(
                                                      FontAwesomeIcons.facebook,
                                                      color: Color.fromRGBO(
                                                          73, 104, 173, 1)),
                                                ),
                                              ))),
                                          SizedBox(
                                            width: iconDistance,
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          editSocials
                                                              .EditSocials()), // button for Login
                                                );
                                              },
                                              child: Center(
                                                  child: CircularProfileAvatar(
                                                '',
                                                backgroundColor:
                                                    Colors.grey.shade300,
                                                radius: socialsSize,
                                                elevation: 5,
                                                child: Center(
                                                  child: FaIcon(
                                                      FontAwesomeIcons
                                                          .instagram,
                                                      color: Color.fromRGBO(
                                                          204, 62, 122, 1)),
                                                ),
                                              ))),
                                          SizedBox(
                                            width: iconDistance,
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          editSocials
                                                              .EditSocials()), // button for Login
                                                );
                                              },
                                              child: Center(
                                                  child: CircularProfileAvatar(
                                                '',
                                                backgroundColor:
                                                    Colors.grey.shade300,
                                                radius: socialsSize,
                                                elevation: 5,
                                                child: Center(
                                                  child: FaIcon(
                                                      FontAwesomeIcons.twitter,
                                                      color: Color.fromRGBO(
                                                          74, 160, 235, 1)),
                                                ),
                                              ))),
                                          SizedBox(
                                            width: iconDistance,
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          editSocials
                                                              .EditSocials()), // button for Login
                                                );
                                              },
                                              child: Center(
                                                  child: CircularProfileAvatar(
                                                '',
                                                backgroundColor:
                                                    Colors.grey.shade300,
                                                radius: socialsSize,
                                                elevation: 5,
                                                child: Center(
                                                  child: FaIcon(
                                                      FontAwesomeIcons.snapchat,
                                                      color: Color.fromRGBO(
                                                          255, 251, 84, 1)),
                                                ),
                                              ))),
                                          SizedBox(
                                            width: iconDistance,
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          editSocials
                                                              .EditSocials()), // button for Login
                                                );
                                              },
                                              child: Center(
                                                  child: CircularProfileAvatar(
                                                '',
                                                backgroundColor:
                                                    Colors.grey.shade300,
                                                radius: socialsSize,
                                                elevation: 5,
                                                child: Center(
                                                  child: FaIcon(
                                                      FontAwesomeIcons.snapchat,
                                                      color: Color.fromRGBO(
                                                          255, 251, 84, 1)),
                                                ),
                                              ))),
                                        ],
                                      )),
                                  sizedBox,
                                  Divider(
                                    color: Colors.grey,
                                    height: 4,
                                    thickness: 0.5,
                                  ),
                                  sizedBox,
                                  Text("IDK",
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
                                    margin: const EdgeInsets.fromLTRB(
                                        16.0, 8.0, 16.0, 16.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    child: Column(
                                      children: <Widget>[
                                        ListTile(
                                          leading: Icon(
                                            Icons.phone,
                                            color: Colors.lightGreen,
                                          ),
                                          title: Text("userDataArray[6]"),
                                          onTap: () {
                                            //open change password
                                          },
                                        ),
                                        ListTile(
                                          leading: Icon(
                                            Icons.email,
                                            color: Colors.lightGreen,
                                          ),
                                          title: Text('Loading...'),
                                          onTap: () {
                                            //open change language
                                          },
                                        ),
                                        ListTile(
                                          leading: Icon(
                                            Icons.cake,
                                            color: Colors.lightGreen,
                                          ),
                                          title: Text('Loading...'),
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
                                    margin: const EdgeInsets.fromLTRB(
                                        16.0, 8.0, 16.0, 16.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    child: Column(
                                      children: <Widget>[
                                        ListTile(
                                          leading: Icon(
                                            Icons.bubble_chart,
                                            color: Colors.lightGreen,
                                          ),
                                          title: Text(
                                              "male, in a relation with his Computer"),
                                          onTap: () {
                                            //open change location
                                          },
                                        ),
                                        ListTile(
                                          leading: Icon(
                                            Icons.people,
                                            color: Colors.lightGreen,
                                          ),
                                          title: Text(
                                              "You got 26 mutural Friends"),
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
                    }),
                DraggableScrollableSheet(
                    maxChildSize: 1.0,
                    minChildSize: 0.13,
                    initialChildSize: 0.13,
                    builder: (context, scrollableController) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        controller: scrollableController,
                        child: Container(
                          height: height - 55,
                          decoration: BoxDecoration(
                            borderRadius: bottomSheetRadius,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                          onPressed: () {
                                            //Todo add
                                          })
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                FadeAnimation(
                                    1.2,
                                    makeItem(
                                        image: 'assets/images/people.jpg',
                                        date: 17)),
                                SizedBox(
                                  height: 20,
                                ),
                                FadeAnimation(
                                    1.3,
                                    makeItem(
                                        image: 'assets/images/people2.jpg',
                                        date: 18)),
                                SizedBox(
                                  height: 20,
                                ),
                                FadeAnimation(
                                    1.4,
                                    makeItem(
                                        image: 'assets/images/people3.jpg',
                                        date: 19)),
                                SizedBox(
                                  height: 20,
                                ),
                                FadeAnimation(
                                    1.5,
                                    makeItem(
                                        image: 'assets/images/people4.jpg',
                                        date: 20)),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ],
        ));
  }

  void _showEditProfileSheet() {
    //Settings
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
                AppBar(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0))),
                  title: Text(
                    "Settings",
                    style: TextStyle(color: Colors.black),
                  ),
                  centerTitle: true,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
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
                                "This is my Biography - edit here",
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
                                Icons.edit,
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
                                    Icons.person_outline,
                                    color: Colors.lightGreen,
                                  ),
                                  title: Text("Edit you Profile"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => addInfo
                                              .AddInfo()), //Link to Information page
                                    );
                                  },
                                ),
                                sizedBox,
                                ListTile(
                                  leading: Icon(
                                    Icons.person_outline,
                                    color: Colors.lightGreen,
                                  ),
                                  title: Text("Edit your Socials"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => editSocials
                                              .EditSocials()), //Link to Information page
                                    );
                                  },
                                ),
                                sizedBox,
                                ListTile(
                                  leading: Icon(
                                    Icons.lock_outline,
                                    color: Colors.lightGreen,
                                  ),
                                  title: Text("About connect"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    _showAlert(); //open change language
                                  },
                                ),
                                sizedBox,
                                ListTile(
                                  leading: Icon(
                                    Icons.security,
                                    color: Colors.lightGreen,
                                  ),
                                  title: Text("Privacy and Security"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    _showPrivacy();
                                    //open change location
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            "Notification Settings",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SwitchListTile(
                            activeColor: Colors.lightGreen,
                            contentPadding: const EdgeInsets.all(0),
                            value: true,
                            title: Text("Chat Notification"),
                            onChanged: (val) {},
                          ),
                          SwitchListTile(
                            activeColor: Colors.lightGreen,
                            contentPadding: const EdgeInsets.all(0),
                            value: true,
                            title: Text("Event Notification"),
                            onChanged: (val) {},
                          ),
                          SwitchListTile(
                            activeColor: Colors.black,
                            contentPadding: const EdgeInsets.all(0),
                            value: false,
                            title: Text("Challange Notoficaions"),
                            onChanged: (val) {},
                          ),
                          Container(
                            height: 40.0,
                            child: GestureDetector(
                              onTap: () async {},
                              child: Material(
                                borderRadius: BorderRadius.circular(50.0),
                                shadowColor: Colors.black,
                                color: Colors.green,
                                elevation: 7.0,
                                child: Center(
                                  child: Text(
                                    'Logout', //Login Button
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

  Widget makeItem({image, date}) {
    return Row(
      children: <Widget>[
        Container(
          width: 50,
          height: 200,
          margin: EdgeInsets.only(right: 20),
          child: Column(
            children: <Widget>[
              Text(
                date.toString(),
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "SEP",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.1),
                  ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Bumbershoot 2019",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "19:00 PM",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}

createBirthdayString(bDayDate) {
  int bdayMonth = bDayDate.month;
  int bdayDay = bDayDate.day;
  String bdayYearS = bDayDate.year.toString();

  List months = [
    'January ',
    'February ',
    'March ',
    'April ',
    'May ',
    'June ',
    'July ',
    'August ',
    'September ',
    'October ',
    'November ',
    'December '
  ];
  String bdayMonthS = months[bdayMonth - 1];

  String bdayDayS;
  if (bdayDay == 1) {
    bdayDayS = bdayDay.toString() + 'st';
  } else if (bdayDay == 2) {
    bdayDayS = bdayDay.toString() + 'nd';
  } else if (bdayDay == 3) {
    bdayDayS = bdayDay.toString() + 'rd';
  } else {
    bdayDayS = bdayDay.toString() + 'th';
  }

  String bDayString = bdayDayS + ' of ' + bdayMonthS + bdayYearS;
  print(bDayString);
  return bDayString;
}

void _showAlert() {
  AlertDialog dialog = AlertDialog(
    content: Container(
      width: 260.0,
      height: 230.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: const Color(0xFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // dialog top
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  // padding: new EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text(
                    'About us',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontFamily: 'helvetica_neue_light',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          // dialog centre
          Expanded(
            child: Container(
              child: Text(
                  "Some randm text IDK yet lulsdgfhiouwahsdvgjisjohugfhdiajowuhgezwfhjhdiasuhiegzwfhbjdqwhgehbjh"),
            ),
            flex: 2,
          ),

          // dialog bottom
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {},
                child: Material(
                  borderRadius: BorderRadius.circular(50.0),
                  shadowColor: Colors.black,
                  color: Colors.green,
                  elevation: 7.0,
                  child: Center(
                    child: Text(
                      'Go Back', //Login Button
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void _logOutFailed() {
  AlertDialog dialog = AlertDialog(
    content: Container(
      width: 260.0, //TODO mediaquery??
      height: 230.0,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // dialog top
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  // padding: new EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text(
                    'Something went wrong:',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20.0,
                      fontFamily: 'helvetica_neue_light',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          // dialog centre
          Expanded(
            child: Container(
              child: Text(
                "It seems like there went somehting wrong in the Logout process. Try agian later or try to reopen the application",
                textAlign: TextAlign.center,
              ),
            ),
            flex: 2,
          ),

          // dialog bottom
          Expanded(
            child: Container(
              height: 20,
              padding: EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {},
                child: Material(
                  borderRadius: BorderRadius.circular(50.0),
                  shadowColor: Colors.black,
                  color: Colors.green,
                  elevation: 7.0,
                  child: Center(
                    child: Text(
                      'Okay', //Login Button
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void _showPrivacy() {
  AlertDialog dialog = AlertDialog(
    content: Container(
      width: 260.0,
      height: 230.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: const Color(0xFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // dialog top
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  // padding: new EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text(
                    'Privacy and Agreement',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontFamily: 'helvetica_neue_light',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          // dialog centre
          new Expanded(
            child: new Container(
              child: Text(
                  "Some randm text IDK yet lulsdgfhiouwahsdvgjisjohugfhdiajowuhgezwfhjhdiasuhiegzwfhbjdqwhgehbjh"),
            ),
            flex: 2,
          ),

          // dialog bottom
          new Expanded(
            child: new Container(
              padding: new EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {},
                child: Material(
                  borderRadius: BorderRadius.circular(50.0),
                  shadowColor: Colors.black,
                  color: Colors.green,
                  elevation: 7.0,
                  child: Center(
                    child: Text(
                      'Go Back', //Login Button
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

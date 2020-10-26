import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:c0nnect/Pages/profile.dart';
import 'package:c0nnect/Pages/contacts.dart';
import 'package:c0nnect/Pages/map.dart';
import 'listEvents.dart' as Event;
import 'package:c0nnect/Pages/showEvent.dart' as Event;

import 'createEvent.dart' as Event;
import 'package:share/share.dart';

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    Map(),
    Contacts(),
    Profile(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: _children[_currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            items: <Widget>[
              Icon(Icons.home, size: 20),
              Icon(Icons.map, size: 20),
              Icon(Icons.contacts, size: 20),
              Icon(Icons.person, size: 20),
            ],
            onTap: onTappedBar,
            animationDuration: Duration(milliseconds: 700),
            animationCurve: Curves.easeInOut,
            backgroundColor: Color.fromRGBO(250, 250, 250, 1),
            buttonBackgroundColor: Colors.white70,
            color: Colors.white,
          ),
        ));
  }
}

Color mainColor = Color(0xff774a63);
Color secondColor = Colors.grey;
Color backgroundColor = Color(0xfffcf1f2);

List<ImageProvider> images = [
  AssetImage('assets/images/people.jpg'),
  AssetImage('assets/images/people2.jpg'),
  AssetImage('assets/images/people3.jpg'),
  AssetImage('assets/images/people4.jpg'),
  AssetImage('assets/images/people5.jpg'),
  AssetImage('assets/images/people6.jpg'),
];

List<ImageProvider> avatars = [
  AssetImage('assets/images/avatar1.jpg'),
  AssetImage('assets/images/avatar2.jpg'),
  AssetImage('assets/images/avatar3.jpg'),
  AssetImage('assets/images/avatar4.jpg'),
  AssetImage('assets/images/avatar5.jpg'),
  AssetImage('assets/images/avatar6.jpg'),
];

List<String> names = [
  ("Susan Parker"),
  ("Somebody Else"),
  ("another kid"),
  ("Henri Klein"),
  ("Henri Klein"),
  ("Henri Klein2"),
];

List<String> mutural = [
  ("27"),
  ("25"),
  ("10"),
  ("2"),
  ("5"),
  ("4"),
];

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: <Widget>[
          Header(),
          Chats(),
          MoodsDetector(),
          NextUp(),
          PostFeed(),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 50, 50, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome back,',
                style: TextStyle(color: secondColor, fontSize: 20),
              ),
              Text(
                'Henri',
                style: TextStyle(color: mainColor, fontSize: 30),
              ),
            ],
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: secondColor.withOpacity(0.5), blurRadius: 20),
              ],
            ),
            child: new IconButton(
              icon: new Icon(Icons.add),
              highlightColor: Colors.pink,
              onPressed: () {
                _showSearch(context); //here
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showSearch(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(0.0),
                topLeft: Radius.circular(85.0))),
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
                              onTap: () {},
                              title: TextField(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    hintStyle: TextStyle(
                                      color: Colors.white70,
                                    ),
                                    //contentPadding: const EdgeInsets.all(15.0),
                                    border: InputBorder.none,
                                    hintText: 'Search in your contacts'),
                              ),
                              leading: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
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
                                  title: Text("Create a new Event"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Event
                                              .DetailsScreen()), //Link to Information page
                                    );
                                  },
                                ),
                                sizedBox,
                                ListTile(
                                  leading: Icon(
                                    Icons.history,
                                    color: Colors.lightGreen,
                                  ),
                                  title: Text("Add specs to event"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {},
                                ),
                                sizedBox,
                                ListTile(
                                  leading: Icon(
                                    Icons.zoom_out_map,
                                    color: Colors.lightGreen,
                                  ),
                                  title: Text("Broadcast yourself"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {},
                                ),
                                sizedBox,
                                ListTile(
                                  leading: Icon(
                                    Icons.touch_app,
                                    color: Colors.lightGreen,
                                  ),
                                  title: Text("Connect to others"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    Share.share('connect wit me (invites link)',
                                        subject: 'lets connect!');
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Center(
                            child: Text(
                              "21 Friends online",
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 20.0),
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

class Chats extends StatelessWidget {
  const Chats({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: avatars.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return index == 0
              ? Container()
              : Container(
            width: 80,
            padding: EdgeInsets.all(3.5),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.deepOrange.shade200, Colors.green],
              ),
            ),
            child: CircleAvatar(
              backgroundImage: avatars[index - 1],
              backgroundColor: Colors.white70,
            ),
          );
        },
      ),
    );
  }
}

class MoodsDetector extends StatelessWidget {
  const MoodsDetector({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
      height: 85,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.all(0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: secondColor.withOpacity(0.2), blurRadius: 15),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: MoodsSelector(),
      ),
    );
  }
}

class NextUp extends StatelessWidget {
  const NextUp({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 15, 25, 0),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: Align(
                alignment: Alignment.centerRight,
                child: new GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Event.listEvents()), //Link to Information page
                    );
                  },
                  child: Text(
                    "Show all events",
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Color(0xFFD9D9D9),
                      backgroundImage:
                          AssetImage("assets/images/HenriKlein.jpeg"),
                      radius: 30.0,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Next Up | Gym with Tom',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\nSunday, May 5th at 8:00 PM',
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text:
                                '\nDavid Lyloyd, Bad Homburg \nAddresszusazt....',
                            style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        color: Colors.grey[400],
                        iconSize: 15,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Event
                                    .EventView()), //Link to Information page
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Divider(
                  color: Colors.grey[200],
                  height: 3,
                  thickness: 1,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _iconBuilder(Icons.check_circle, "I'm Here"),
                    _iconBuilder(Icons.cancel, 'Cancel'),
                    _iconBuilder(Icons.directions, 'Directions'),
                    _iconBuilder(Icons.people, 'Who?'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _iconBuilder(icon, title) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 28,
          color: Colors.black,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class PostFeed extends StatelessWidget {
  const PostFeed({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: avatars.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.fromLTRB(25, 30, 25, 0),
            height: 280,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: images[index],
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: secondColor.withOpacity(0.25),
                ),
              ],
            ),
            child: Container(
              height: 90,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: avatars[index],
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        names[index],
                        style: TextStyle(
                          fontSize: 20,
                          color: mainColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        mutural[index] + ' mutural Friends',
                        style: TextStyle(
                          fontSize: 15,
                          color: secondColor,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.more_vert,
                    color: mainColor,
                    size: 30,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ------

// ignore: must_be_immutable
class CategorieTile extends StatefulWidget {
  String categorie;
  bool isSelected;
  Home context;
  CategorieTile({this.categorie, this.isSelected, this.context});

  @override
  _CategorieTileState createState() => _CategorieTileState();
}

class _CategorieTileState extends State<CategorieTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(left: 8),
        height: 30,
        decoration: BoxDecoration(
            color: widget.isSelected ? Color(0xffFFD0AA) : Colors.white,
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          widget.categorie,
          style: TextStyle(
              color: widget.isSelected ? Color(0xffFC9535) : Color(0xffA1A1A1)),
        ),
      ),
    );
  }
}

class MoodsSelector extends StatefulWidget {
  // MoodsSelector({Key key}) : super(key: key);

  @override
  _MoodsSelectorState createState() => _MoodsSelectorState();
}

class _MoodsSelectorState extends State<MoodsSelector> {
  //List<bool> isSelected = List.generate(5, (_) => false);
  List<bool> isSelected = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        selectedColor: Colors.green,
        color: Colors.orangeAccent,
        borderColor: Colors.transparent,
        renderBorder: false,
        fillColor: Colors.transparent,
        children: <Widget>[
          Icon(
            Icons.directions_run,
            size: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Icon(
              Icons.favorite,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Icon(
              Icons.local_bar,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Icon(
              Icons.live_tv,
              size: 30,
            ),
          ),
          Icon(
            Icons.assignment,
            size: 30,
          ),
        ],
        isSelected: isSelected,
        onPressed: (int index) {
          setState(() {
            // for (int buttonIndex = 0;
            //     buttonIndex < isSelected.length;
            //     buttonIndex++) {
            //   if (buttonIndex == index) {
            //     isSelected[buttonIndex] = true;
            //   } else {
            //     isSelected[buttonIndex] = false;
            //   }
            // }

            isSelected[index] = !isSelected[index];
          });
        },
      ),
    );
  }
}

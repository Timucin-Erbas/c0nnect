import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';

const kBlackColor = Color(0xFF393939);
const kLightBlackColor = Color(0xFF8F8F8F);
const kIconColor = Color(0xFFF48A37);
const kProgressIndicator = Color(0xFFBE7066);

final kShadowColor = Color(0xFFD3D3D3).withOpacity(.84);

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ResponsiveContainer(
                  widthPercent: 58,
                  heightPercent: 40,
                  child: Basics(),
                ),
                ResponsiveContainer(
                  widthPercent: 40,
                  heightPercent: 30,
                  child: Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://previews.123rf.com/images/scukrov/scukrov1307/scukrov130700001/20696496-a-yellow-table-tennis-ball-resting-on-a-group-of-red-plastic-cups-arranged-for-playing-beer-pong-iso.jpg"),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.25),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.fromLTRB(32, 0.0, 32.0, 16.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.info_outline,
                      color: Colors.lightGreen,
                    ),
                    title: Text("What kind of event"),
                    trailing: Icon(Icons.edit),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    onTap: () {

                    },
                    title: TextField(
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                      decoration: InputDecoration(
                          labelStyle: TextStyle(

                            color: Colors.black54,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          //contentPadding: const EdgeInsets.all(15.0),
                          border: InputBorder.none,
                          hintText: 'Whats the occasion'),
                    ),
                    leading: Icon(
                      Icons.text_rotation_angledown,
                      color: Colors.lightGreen,
                      size: 30,
                    ),
                    trailing: Icon(Icons.edit),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.map,
                      color: Colors.lightGreen,
                    ),
                    title: Text("Select place on map"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      //open change location
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.people_outline,
                      color: Colors.lightGreen,
                    ),
                    title: Text("select invitees"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      //open change language
                    },
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: SwitchListTile(
                activeColor: Colors.lightGreen,
                contentPadding: const EdgeInsets.all(0),
                value: true,
                title: Text("want friends to bring food?"),
                onChanged: (val) {},
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
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
                      'Create | invite Friends', //Login Button
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
    );
  }
}

class ChapterCard extends StatelessWidget {
  final String name;
  final String tag;
  final int chapterNumber;
  final Function press;
  const ChapterCard({
    Key key,
    this.name,
    this.tag,
    this.chapterNumber,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      margin: EdgeInsets.only(bottom: 16),
      width: size.width - 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38.5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 33,
            color: Color(0xFFD3D3D3).withOpacity(.84),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Chapter $chapterNumber : $name \n",
                  style: TextStyle(
                    fontSize: 16,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: tag,
                  style: TextStyle(color: kLightBlackColor),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
            onPressed: press,
          )
        ],
      ),
    );
  }
}

class Basics extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25),
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top: 50,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Houseparty @",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontSize: 22),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 5,
                    ),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 0),
                    child: Text(
                      "Host/Loc",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, right: 55),
                    child: Text(
                      "This is some rnadom text imput, where the Host will imput a basic textwethfoiwuwarhdiqu",
                      maxLines: 5,
                      style: TextStyle(
                        fontSize: 12,
                        color: kLightBlackColor,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Whitelisted",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      BookRating(people: "36"),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class BookRating extends StatelessWidget {
  final String people;
  const BookRating({
    this.people,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 7),
            blurRadius: 20,
            color: Color(0xFD3D3D3).withOpacity(.5),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.people_outline,
            color: Colors.black,
            size: 15,
          ),
          SizedBox(width: 5),
          Text(
            "$people",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

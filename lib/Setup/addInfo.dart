import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:c0nnect/Pages/MainPage.dart' as MainPage;
import 'package:intl/intl.dart';

class AddInfo extends StatefulWidget {
  @override
  _AddInfoState createState() => new _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {
  int agelimit = 16;

  //Validator Key
  final _formKey = GlobalKey<FormState>();
  final _formKeyTwo = GlobalKey<FormState>();

  //Information variables
  String name = '',
      surname = '',
      nickname = '',
      description = '',
      interests = '';

  //Get current Date for CupertinoDatePicker
  var enteredDate = DateTime.now();
  String stringentereddate = DateFormat('dd.MM.yyyy').format(DateTime.now());

  //For fitting to each smartphone
  double sizedependend;
  double spaceFirstSecondForm;
  int dividing;
  double percentageprofilepicheight;
  double percentageprofilepicheightNoInfo;
  double finishanswersspacing;
  double spaceradioupperform;

  String path; //photo shown at beginning

  int gender;
  String radioButtonItem = 'ONE';
  bool radioNotButtonPushed = false;

  bool noValidInfoFirstForm = false;

  bool tooYoung = false;

  bool dateNotChanged = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    if (size >= 750) {
      sizedependend = 50; //Button size
      spaceFirstSecondForm = 0;
      percentageprofilepicheight = 23;
      percentageprofilepicheightNoInfo = 28;
      finishanswersspacing = 30;
      spaceradioupperform = 18;
      dividing = 3; //part of the screen for cupertino date picker
    } else {
      sizedependend = 44;
      spaceFirstSecondForm = 0;
      percentageprofilepicheight = 25;
      percentageprofilepicheightNoInfo = 34.1;
      finishanswersspacing = 15;
      spaceradioupperform = 0;
      dividing = 2;
    }

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                        child: Text('about you', //about you
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ResponsiveContainer(
                          widthPercent: 30.0,
                          heightPercent: 16.0,
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 150,
                                    child: Column(children: <Widget>[
                                      ListTile(
                                          leading: Icon(Icons.photo_camera),
                                          title: Text(
                                              "Take a picture from Camera"),
                                          onTap: () {}),
                                      ListTile(
                                          leading: Icon(Icons.photo_library),
                                          title:
                                              Text("Choose from photo Library"),
                                          onTap: () async {
                                            final file =
                                                await ImagePicker.pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            print(file.path);
                                            setState(() {
                                              path = file.path;
                                            });
                                            Navigator.pop(context);
                                          })
                                    ]),
                                  );
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: CircleAvatar(
                                backgroundImage: (path == null
                                    ? Image.asset("assets/LoadingScreen.jpg")
                                        .image
                                    : Image.file(File(path)).image),
                                radius: 100.0,
                              ),
                            ),
                          ),
                        ),
                        ResponsiveContainer(
                          widthPercent: 50.0,
                          heightPercent:
                              radioNotButtonPushed || noValidInfoFirstForm
                                  ? percentageprofilepicheightNoInfo
                                  : percentageprofilepicheight,
                          child: Container(
                            child: Container(
                              child: Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'First Name',
                                              labelStyle: TextStyle(
                                                  fontFamily:
                                                      'Montserrat', //First Name
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.green))),
                                          validator: (str) {
                                            if (str.length > 1) {
                                              return null;
                                            } else {
                                              return ('Your Name please');
                                            }
                                          },
                                          autocorrect: false,
                                          onChanged: (str) {
                                            setState(() => name = str);
                                          }),
                                      TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'Last Name',
                                              labelStyle: TextStyle(
                                                  fontFamily:
                                                      'Montserrat', //Last Name
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.green))),
                                          validator: (str) {
                                            if (str.length > 1) {
                                              return null;
                                            } else {
                                              return ('Dude your Last Name!');
                                            }
                                          },
                                          autocorrect: false,
                                          onChanged: (str) {
                                            setState(() => surname = str);
                                          }),
                                      SizedBox(
                                          height: radioNotButtonPushed ||
                                                  noValidInfoFirstForm
                                              ? 0
                                              : spaceradioupperform),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Radio(
                                            value: 0,
                                            groupValue: gender,
                                            activeColor: Colors.blue,
                                            onChanged: (val) {
                                              setState(() {
                                                radioButtonItem = 'male';
                                                gender = 0;
                                              });
                                            },
                                          ),
                                          Text(
                                            'male',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat', //Interests
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                          Radio(
                                            value: 1,
                                            groupValue: gender,
                                            activeColor: Colors.purple,
                                            onChanged: (val) {
                                              setState(() {
                                                radioButtonItem = 'female';
                                                gender = 1;
                                              });
                                            },
                                          ),
                                          Text(
                                            'female',
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat', //Interests
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 0, left: 15),
                                        width: double.infinity,
                                        child: radioNotButtonPushed
                                            ? Text('Select your gender!',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 13,
                                                    color: Color.fromRGBO(
                                                        216, 74, 74, 1)))
                                            : SizedBox(),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: spaceFirstSecondForm, left: 20, right: 20),
                      child: Form(
                          key: _formKeyTwo,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                  autofocus: true,
                                  decoration: InputDecoration(
                                      labelText: 'How your Freinds call you...',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat', //Nickname
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                  validator: (str) {
                                    if (str.length > 1) {
                                      return null;
                                    } else {
                                      return ("You don't have any Friends?");
                                    }
                                  },
                                  autocorrect: false,
                                  onChanged: (str) {
                                    setState(() => nickname = str);
                                  }),
                              Container(
                                padding: EdgeInsets.only(top: 18),
                                child: GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          //TODO create void for it
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              dividing,
                                          child: Column(
                                            children: <Widget>[
                                              //Container(
                                              //height: sizedependend,
                                              //color: Colors.white,
                                              //padding: EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
                                              //child: Align(
                                              //alignment: Alignment.centerRight,
                                              //child: RaisedButton(
                                              //onPressed: () {
                                              //Navigator.pop(context);},
                                              //child: InkWell(
                                              //child: Text(
                                              //'Use',
                                              //style: TextStyle(                                                                                                    //DatePicker
                                              //color: Colors.green,
                                              //fontWeight: FontWeight.bold,
                                              //fontFamily: 'Montserrat',),
                                              //  ),
                                              //  )
                                              //),
                                              //),
                                              //),
                                              Container(
                                                  height:
                                                      (MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          dividing),
                                                  child: CupertinoDatePicker(
                                                    mode:
                                                        CupertinoDatePickerMode
                                                            .date,
                                                    initialDateTime:
                                                        enteredDate,
                                                    minimumYear: 1900,
                                                    maximumYear:
                                                        DateTime.now().year,
                                                    onDateTimeChanged:
                                                        (DateTime newDate) {
                                                      setState(() {
                                                        enteredDate = newDate;
                                                        stringentereddate =
                                                            DateFormat(
                                                                    'dd.MM.yyyy')
                                                                .format(
                                                                    newDate);
                                                        dateNotChanged = false;
                                                      });
                                                    },
                                                  )),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 40.0,
                                    //width: (MediaQuery.of(context).size.width),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            width: 1.0,
                                            color: tooYoung || dateNotChanged
                                                ? Color.fromRGBO(216, 74, 74, 1)
                                                : Colors.grey),
                                      ),
                                      color: Colors.transparent,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start, //Birthday Button
                                      children: <Widget>[
                                        Center(
                                          child: Text(
                                              'Your Birthday:   ' +
                                                  stringentereddate,
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat', //describe yourself
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Colors.grey)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 7, left: 0),
                                width: double.infinity,
                                child: tooYoung
                                    ? Text(
                                        'Sorry you need to be at lest $agelimit years old',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 13,
                                            color:
                                                Color.fromRGBO(216, 74, 74, 1)))
                                    : dateNotChanged
                                        ? Text('Please enter a date...',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 13,
                                                color: Color.fromRGBO(
                                                    216, 74, 74, 1)))
                                        : SizedBox(),
                              ),
                              TextFormField(
                                  autofocus: true,
                                  decoration: InputDecoration(
                                      labelText:
                                          'one sentence to describe yourself',
                                      labelStyle: TextStyle(
                                          fontFamily:
                                              'Montserrat', //describe yourself
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                  autocorrect: false,
                                  onChanged: (str) {
                                    setState(() => description = str);
                                  }),
                              TextFormField(
                                  autofocus: true,
                                  decoration: InputDecoration(
                                      labelText:
                                          'What is your greatest interest',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat', //Interests
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                  autocorrect: false,
                                  onChanged: (str) {
                                    setState(() => interests = str);
                                  }),
                              SizedBox(height: 40.0),
                              Container(
                                height: 40.0,
                                child: GestureDetector(
                                  onTap: () async {},
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    shadowColor: Colors.greenAccent,
                                    color: Colors.green,
                                    elevation: 7.0,
                                    child: Center(
                                      child: Text(
                                        'Finish', //Login Button
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: finishanswersspacing,
                              ),
                              Container(
                                  height: 30,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainPage.SecondRoute()),
                                      ); //TODO add sheet
                                    },
                                    child: Text(
                                      'Why do we save em',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ))
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/UserData.txt');
  }
}

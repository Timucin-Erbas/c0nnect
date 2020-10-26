import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:c0nnect/Pages/MainPage.dart' as MainPage;
import 'package:path_provider/path_provider.dart';

class EditSocials extends StatefulWidget {
  @override
  _EditSocialsState createState() => new _EditSocialsState();
}

class _EditSocialsState extends State<EditSocials> {
  final _instaformKey = GlobalKey<FormState>();
  final _twitterformKey = GlobalKey<FormState>();

  String instagram, twitter, facebook, snapchat;

  String lastValidatedUsername;
  String lastRejectedUsername;

  var userDataArray;
  double socialsSize = 30;

  //Insta Check Username for exsistance
  Future<void> instaCheckForExsistance(str) async {
    final requests = await http.get('https://www.instagram.com/$str/?__a=1');
    if (requests.statusCode != 404) {
      lastValidatedUsername = str;
    } else {
      lastRejectedUsername = str;
    }
    _instaformKey.currentState
        .validate(); // this will re-initiate the validation
  }

  String validateInstagram(str) {
    if (str == lastValidatedUsername) {
      //setState(() {
      //twitter = str;
      //});
      return null;
    } else if (str == '') {
      return null;
    } else if (str == lastRejectedUsername) {
      return 'This Username does not exsist';
    } else {
      instaCheckForExsistance(str);
      return "Validation in progress...";
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData().then((List returnedV) {
      setState(() {
        userDataArray = returnedV;
      });
    });
    print(userDataArray);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
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
                      child: Text('what you show',
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationThickness: 0.4,
                          )
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Form(
                          key: _instaformKey,
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Instagram Username',
                                labelStyle: TextStyle(
                                    fontFamily:
                                        'Montserrat', //Email- Email Registration
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green))),

                          )
                      ),
                      Form(
                          key: _twitterformKey,
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Twitter',
                                labelStyle: TextStyle(
                                    fontFamily:
                                        'Montserrat', //Email- Email Registration
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green))),
                          )
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                              labelText: 'FaceBook',
                              labelStyle: TextStyle(
                                  fontFamily:
                                      'Montserrat', //Email- Email Registration
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          validator: (str) {
                            if (str.contains('https://www.facebook.com/') ||
                                str == null) {
                              return null;
                            } else {
                              return ('Enter a valid URL please');
                            }
                          },
                          autocorrect: false,
                          onChanged: (str) {
                            setState(() => facebook = str);
                          }),
                      TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Snapchat',
                              labelStyle: TextStyle(
                                  fontFamily:
                                      'Montserrat', //Email- Email Registration
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          validator: (str) {
                            if (str.contains('https://www.facebook.com/') ||
                                str == null) {
                              return null;
                            } else {
                              return ('Enter a valid URL please');
                            }
                          },
                          autocorrect: false,
                          onChanged: (str) {
                            setState(() => snapchat = str);
                          }),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Skype',
                            labelStyle: TextStyle(
                                fontFamily:
                                    'Montserrat', //Email- Email Registration
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Website',
                              labelStyle: TextStyle(
                                  fontFamily:
                                      'Montserrat', //Email- Email Registration
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          validator: (str) {
                            checkWebsite(str);
                            if (str.contains('https://www.facebook.com/') ||
                                str == null) {
                              return null;
                            } else {
                              return ('Enter a valid URL please');
                            }
                          },
                          autocorrect: false,
                          onChanged: (str) {
                            setState(() => snapchat = str);
                          }),
                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage.SecondRoute()),
                            );
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: Center(
                              child: Text(
                                'Finish', //Finish Button
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
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPage.SecondRoute()),
                          );
                        },
                        child: Text(
                          'Why do we save em',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Future<http.Response> checkWebsite(str) {
    return http.get('https://jsonplaceholder.typicode.com/albums/1');
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/UserData.txt');
  }

  Future<List> getUserData() async {
    final file = await _localFile;
    String userDataString = await file.readAsString(); // Read the file
    var userDataDevice = userDataString.split(',');
    print(userDataDevice);
    return userDataDevice;
  }
}

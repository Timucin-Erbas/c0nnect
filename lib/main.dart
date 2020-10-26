import 'package:flutter/material.dart';
import 'file:///Users/henri/development/c0nnect/lib/Setup/Login.dart' as Login;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'c0nnect',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Google'),
      home: Login.LoginPage(),
    );
  }
}

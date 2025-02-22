import 'package:flutter/material.dart';
import 'package:flutter_sandbox/profile/presentation//page/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String appTitle = 'Profile Page';

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: appTitle,
    debugShowCheckedModeBanner: false,
    home: MainPage(appTitle: appTitle),
  );
}

class MainPage extends StatelessWidget {
  final String appTitle;

  const MainPage({this.appTitle});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(appTitle),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ProfileTwoPage(),
    ),
  );
}
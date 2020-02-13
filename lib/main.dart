import 'package:flutter/material.dart';
import 'package:flutter_sandbox/prototipo-rotina/pages/AboutPage.dart';
import 'package:flutter_sandbox/prototipo-rotina/pages/HomePage.dart';
import 'package:flutter_sandbox/prototipo-rotina/pages/ItemAddPage.dart';
import 'package:flutter_sandbox/prototipo-rotina/pages/ItemEditPage.dart';
import 'package:flutter_sandbox/prototipo-rotina/pages/Layout.dart';
import 'package:flutter_sandbox/prototipo-rotina/pages/SettingsPage.dart';

import 'prototipo-rotina/pages/RotinaPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final routes = <String, WidgetBuilder> {
    HomePage.tag: (context) => HomePage(),
    AboutPage.tag: (context) => AboutPage(),
    SettingsPage.tag: (context) => SettingsPage(),
    RotinaPage.tag: (context) => RotinaPage(),
    ItemAddPage.tag: (context) => ItemAddPage(),
    ItemEditPage.tag: (context) => ItemEditPage(),
  };

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primaryColor: Layout.primary(),
        accentColor: Layout.secondary(),
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 24, fontStyle: FontStyle.italic, color: Layout.primary()),
          body1: TextStyle(fontSize: 14),
        )
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: routes, 
    );
  }
}
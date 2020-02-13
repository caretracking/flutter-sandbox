import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static final String tag = 'settings-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text(tag),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(tag),
    ),
  );

  }
}
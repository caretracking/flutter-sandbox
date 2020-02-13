
import 'package:flutter/material.dart';

class RotinaPage extends StatelessWidget {
  static final String tag = 'rotina-page';

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
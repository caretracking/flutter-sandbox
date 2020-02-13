import 'package:flutter/material.dart';
import 'package:flutter_sandbox/prototipo-rotina/pages/Layout.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {

  static String tag = 'about-page';

  @override
  Widget build(BuildContext context){

    // Container theLogo = Container(
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(15),
    //     child: Image.asset(
    //       'assets/images/logo.png',
    //       scale: 2.0,
    //       width: 200,
    //     )
    //   )
    // );

    Container appLink = Container(
      width: 180,
      child: RaisedButton(
        color: Layout.secondary(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(FontAwesomeIcons.externalLinkAlt, color: Colors.white, size: 10),
            SizedBox(width: 5),
            Text(' www.caretracking.com', style: TextStyle(color: Colors.white))
          ]
        ),
        onPressed: () {
          String url = 'https://www.caretracking.com';
          canLaunch(url).then((status) {
            if (status) {
              launch(url);
            } else {
              // Show an snackbar error
              Scaffold.of(Layout.scaffoldContext).showSnackBar(SnackBar(
                content: Text('Não foi possível abrir o site, tente novamente mais tarde'),
                duration: Duration(seconds: 15),
              ));
            }
          });
        },
      ),
    );

    Container linkYoutube = Container(
      width: 180,
      child: RaisedButton(
        color: Layout.primary(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(FontAwesomeIcons.youtube, color: Colors.white, size: 15),
            SizedBox(width: 5),
            Text('  Caretracking no YouTube', style: TextStyle(color: Colors.white))
          ],
        ),
        onPressed: () {
          String url = 'https://www.youtube.com/';
          canLaunch(url).then((status) {
            if (status) {
              launch(url);
            } else {
              // Show an snackbar error
              Scaffold.of(Layout.scaffoldContext).showSnackBar(SnackBar(
                content: Text('Não foi possível abrir o site, tente novamente mais tarde'),
                duration: Duration(seconds: 15),
              ));
            }
          });
        },
      ),
    );

    return Layout.getContent(context, Center(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Center(child: Text('About', style: TextStyle(
            fontSize: 22,
            color: Layout.primary(),
            fontWeight: FontWeight.bold)
          )),
          SizedBox(height: 10),
          Center(child: Text('Listas de Assistidos', style: TextStyle(fontSize: 16))),
          SizedBox(height: 20),
          // Center(child: Text('Um aplicativo Flutter por:')),
         // Center(child: theLogo),
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              appLink,
              linkYoutube
            ]
          )
        ],
      ),
    ));
  }
}
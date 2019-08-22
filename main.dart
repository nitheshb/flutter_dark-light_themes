import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//Using Bloc
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkThemeEnabled,
      initialData: false,
      builder: (context, snapshot) => MaterialApp(
          theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
          home: HomePage(snapshot.data)),
    );
  }
}

class HomePage extends StatelessWidget {
  final bool darkThemeEnabled;

  HomePage(this.darkThemeEnabled);
  
  var list = ["one","two"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Theme"),
      ),
      body: 
        new Container(
        //adding padding around card
        padding: new EdgeInsets.all(20.0),
        child: new ListView(
          children: <Widget>[
            // new Text("Hey"),
            // new Text("My name"),
            // new Text("Is Raunak")

            new MyCard(
              title: new Text("I love Flutter", style: new TextStyle(fontSize: 20.0)),
              icon: new Icon(Icons.favorite, size: 40.0, color: Colors.redAccent)
            ),
            new MyCard(
              title: new Text("I eat Donuts", style: new TextStyle(fontSize: 20.0)),
              icon: new Icon(Icons.donut_large, size: 40.0, color: Colors.brown)
            ),
            new MyCard(
              title: new Text("I see you", style: new TextStyle(fontSize: 20.0)),
              icon: new Icon(Icons.visibility, size: 40.0, color: Colors.blue)
            ),
            new MyCard(
              title: new Text("I use Android", style: new TextStyle(fontSize: 20.0)),
              icon: new Icon(Icons.android, size: 40.0, color: Colors.green)
            ),
            new MyCard(
              title: new Text("I read Books", style: new TextStyle(fontSize: 20.0)),
              icon: new Icon(Icons.book, size: 40.0, color: Colors.purple)
            ),
            new MyCard(
              title: new Text("I call with Phone", style: new TextStyle(fontSize: 20.0)),
              icon: new Icon(Icons.phone, size: 40.0, color: Colors.purple)
            ),
            new MyCard(
              title: new Text("we wish healthy to everyone", style: new TextStyle(fontSize: 20.0)),
              icon: new Icon(Icons.child_care, size: 40.0, color: Colors.blueGrey)
            ),
            new MyCard(
              title: new Text("i take a Picture", style: new TextStyle(fontSize: 20.0)),
              icon: new Icon(Icons.camera, size: 40.0, color: Colors.redAccent)
            ),
          ],
        ),
        ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Dark Theme"),
              trailing: Switch(
                value: darkThemeEnabled,
                onChanged: bloc.changeTheme,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();


class MyCard extends StatelessWidget {
  //adding constructor
  MyCard({this.title, this.icon});

  final Widget title;
  final Widget icon;

  @override
  Widget build(BuildContext context){
    return new Container(
      //adding bottom padding on card
      padding: new EdgeInsets.only(bottom: 20.0),
      child: new Card(
        child: new Container(
          //adding padding inside card
          padding: new EdgeInsets.all(15.0),
          child: new Column(
          children: <Widget>[
              // new Text("I love Flutter"),
              // new Icon(Icons.favorite)

              this.title,
              this.icon
            ]
          )
        )
        
      )
    );
  }
}

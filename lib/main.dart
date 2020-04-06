import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:trocadelivros2/login.dart';

import 'layout.dart';

//import 'package:trocadelivros2/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget content = StreamBuilder(
      stream: Firestore.instance.collection('usuarios').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return LinearProgressIndicator();
            break;
          default:
            return Center(
              child: ListView(
                children:
                    snapshot.data.documents.map<Widget>((DocumentSnapshot doc) {
                  return ListTile(
                    leading: Icon(Icons.people, size: 52),
                    title: Text(
                        "${doc.data['nome']} - ${doc.data['idade'].toString()} anos"),
                    subtitle: Text(doc.data['telefone']),
                  );
                }).toList(),
              ),
            );
        }
      },
    );

    return Layout.render(content);
  }
}

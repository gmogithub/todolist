import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"/home": (context) => Home()},
      home: Builder(
        builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text("Todo list"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/home");
                    },
                  )
                ],
              ),
              body: ListView(
                children: todos
                    .map(
                      (todo) => Center(
                            child: Text(todo),
                          ),
                    )
                    .toList(),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: onPressed,
                child: Icon(Icons.add),
              ),
            ),
      ),
    );
  }

  void onPressed() {
    this.setState(() {
      todos.add("Hello world");
    });
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: RaisedButton(
            child: Icon(Icons.keyboard_return),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:umimamoru_flutter/presentation/title/title.dart' as title;

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generated App',
      theme: ThemeData(
          primaryColor: Colors.green[400]
      ),
      home: title.Title(),
    );
  }
}
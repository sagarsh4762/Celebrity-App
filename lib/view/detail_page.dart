import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        title: const Text("Celebrity App Information"),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            'The Celebrity API provides the most popular information, such as net worth, profession, and birthday, on of famous individuals all around the world. Our comprehensive database contains actors/actresses, athletes, politicians, business leaders, and much more.',
            textScaleFactor: 1.5,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Source Sans Pro',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

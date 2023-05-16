import 'package:flutter/material.dart';

class appli extends StatefulWidget {
  const appli({Key? key}) : super(key: key);

  @override
  State<appli> createState() => _appliState();
}

class _appliState extends State<appli> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("succesfully logined",style: TextStyle(color: Colors.cyan),)
        ],
      ),
    );
  }
}

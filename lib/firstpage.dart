import 'package:flutter/material.dart';

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'),
      ),
      body: Center(
        child: Text('Welcome Home',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue),),
      ),
    );
  }
}
import 'package:dashb/screenother/tablet/part_one.dart';
import 'package:dashb/screenother/tablet/part_two.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Tablet1(),
    );
  }
}

class Tablet1 extends StatefulWidget {
  const Tablet1({super.key});

  @override
  State<Tablet1> createState() => _Tablet1State();
}

class _Tablet1State extends State<Tablet1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container( height: 300, width : 23, color: Colors.red,),
      ),
      backgroundColor: Colors.green,
      body: Row(
        children: [
          Expanded(flex: 2,child: PartOne()),
          Flexible(flex : 1, child: PartTwo()),
        ],
      ),
    );
  }
}

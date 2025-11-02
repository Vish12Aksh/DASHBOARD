import 'package:dashb/response/layout1.dart';
import 'package:dashb/screenother/desktop/desktop.dart';
import 'package:dashb/screenother/mobile/mobile.dart';
import 'package:dashb/screenother/tablet/tablet.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Layout1(
          mobileScaffold: Mobile1(),
          tabletScaffold: Tablet1(),
          desktopScaffold: Desktop1()
      ),
    );
  }
}


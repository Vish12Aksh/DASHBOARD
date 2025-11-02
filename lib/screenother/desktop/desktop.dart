import 'package:dashb/screenother/desktop/part_one_screen.dart';
import 'package:dashb/screenother/desktop/part_three_screen.dart';
import 'package:dashb/screenother/desktop/part_two_screen.dart';
import 'package:flutter/material.dart';

class Desktop1 extends StatelessWidget {
  const Desktop1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Row(
        children: [
          Expanded(flex: 1, child: PartoneScreen()),
          Expanded(flex: 3, child: PartTwoScreen()),
          Expanded(flex: 1, child: PartThreeScreen()),
        ],
      ),
    );
  }
}

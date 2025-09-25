
import 'package:flutter/material.dart';

class Layout1 extends StatelessWidget {

  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  Layout1({required this.mobileScaffold, required this.tabletScaffold, required this.desktopScaffold});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth  < 654){
        return mobileScaffold;
      }else if(constraints.maxWidth < 1105){
        return tabletScaffold;
      } else {
        return desktopScaffold;
      }
    });
  }
}

import 'package:dashb/model_desgin/model_desgin.dart';
import 'package:flutter/material.dart';

class Model_Data{

  final item_menu = const <MenuModel>[
    MenuModel(title: 'Home', icon: Icons.home),
    MenuModel(title: 'Employees', icon: Icons.person),
    MenuModel(title: 'Attendance', icon: Icons.checklist_rounded),
    MenuModel(title: 'Summary', icon: Icons.summarize),
    MenuModel(title: 'Information', icon: Icons.info),
  ];
}
import 'package:flutter/material.dart';

class BottomTabModel {
  final int index;
  final IconData icon;
  final String title;
  final Color color;

  BottomTabModel({
    @required this.index,
    @required this.icon,
    @required this.title,
    @required this.color,
  });

  factory BottomTabModel.fromJson(Map<String, dynamic> data) {
    return BottomTabModel(
      index: data['index'],
      color: data['color'],
      icon: data['icon'],
      title: data['title'],
    );
  }
}

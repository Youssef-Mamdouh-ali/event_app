import 'package:flutter/cupertino.dart';

class EventCategoryModel {
  final String id;

  final String name;

  final String image;

  final String darkImage;

  final IconData iconData;

  EventCategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.darkImage,
    required this.iconData,
  });
}

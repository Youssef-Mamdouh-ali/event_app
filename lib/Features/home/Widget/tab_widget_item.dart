import 'package:event_app/models/event_category_model.dart';
import 'package:event_app/utils/appColors.dart';
import 'package:flutter/material.dart';
class TabWidgetItem extends StatelessWidget {
  final EventCategoryModel eventCategoryModel ;
  final bool isSelected ;
  const TabWidgetItem({super.key , required this.eventCategoryModel , required this.isSelected});

  @override
  Widget build(BuildContext context) {

    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
      decoration: BoxDecoration(color: isSelected ? Appcolors.primaryColor : Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        spacing: 8,
        children: [
       Icon(eventCategoryModel.iconData , color: isSelected ? Colors.white : Appcolors.blackColor,),
        Text(eventCategoryModel.name , style: TextStyle(color:isSelected ? Colors.white : Appcolors.primaryColor))
      ],),
    );
  }
}

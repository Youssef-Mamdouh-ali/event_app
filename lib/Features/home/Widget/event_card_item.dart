import 'package:event_app/Features/event_details/event_details.dart';
import 'package:event_app/models/event_data_model.dart';
import 'package:event_app/utils/appAssets.dart';
import 'package:event_app/utils/appColors.dart';
import 'package:event_app/utils/firestore/firestore_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class EventCardItem extends StatelessWidget {
  final EvenDataModel dataModel;

  const EventCardItem({super.key, required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EventDetails(event: dataModel),
        ),
      );
    },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: 190,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(dataModel.categoryImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Appcolors.strokeColor,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              child: Text(
                DateFormat("dd,MMM").format(dataModel.eventDate),
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Appcolors.strokeColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      dataModel.eventDescription,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      dataModel.isFavorite = !dataModel.isFavorite;
                      FirestoreUtils.updateEvent(dataModel);
                    },
                    icon: SvgPicture.asset(
                      dataModel.isFavorite
                          ? Appassets.active_favorite_icon
                          : Appassets.inactive_favorite_icon,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

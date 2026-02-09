import 'package:event_app/Features/add_event/add_event.dart';
import 'package:event_app/models/event_data_model.dart';
import 'package:event_app/utils/appColors.dart';
import 'package:event_app/utils/firestore/firestore_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDetails extends StatelessWidget {
  final EvenDataModel event;

  const EventDetails({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Event Details", style: TextStyle(color: Appcolors.primaryColor)),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Appcolors.primaryColor),
        ),
        actions: [
          /// edit event
          IconButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddEvent(event: event),
              ),
            );
          }, icon: const Icon(Icons.edit, color: Appcolors.primaryColor)),
          /// delete event
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Delete Event"),
                  content: const Text("Are you sure you want to delete this event?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context), // إغلاق النافذة
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () async {
                        await FirestoreUtils.deleteEvent(event.eventId!);

                        if (context.mounted) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Delete", style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          ),        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// category image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  event.categoryImage,
                  height: height * 0.25,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                event.eventDescription,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Appcolors.primaryColor),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_month, color: Appcolors.primaryColor, size: 40),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat("dd MMMM yyyy").format(event.eventDate),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          DateFormat("hh:mm a").format(event.eventDate),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              /// Description
              Text(
                event.eventDescription,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
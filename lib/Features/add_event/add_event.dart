import 'package:event_app/Features/home/Widget/tab_widget_item.dart';
import 'package:event_app/core/widgets/customElevatedButton.dart';
import 'package:event_app/core/widgets/customTextFormField.dart';
import 'package:event_app/models/event_category_model.dart';
import 'package:event_app/models/event_data_model.dart';
import 'package:event_app/utils/appAssets.dart';
import 'package:event_app/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/firestore/firestore_utils.dart';

class AddEvent extends StatefulWidget {
  final EvenDataModel? event;

  const AddEvent({super.key, this.event});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final List<EventCategoryModel> categories = [
    EventCategoryModel(
      id: "sport",
      name: "Sport",
      image: Appassets.sportCateLight,
      darkImage: Appassets.sportCateDark,
      iconData: Icons.directions_bike_rounded,
    ),
    EventCategoryModel(
      id: "birthday",
      name: "Birthday",
      image: Appassets.birthdayCateLight,
      darkImage: Appassets.birthdayCateDark,
      iconData: Icons.cake,
    ),
    EventCategoryModel(
      id: "book",
      name: "Book",
      image: Appassets.bookCateLight,
      darkImage: Appassets.bookCateDark,
      iconData: Icons.chrome_reader_mode_rounded,
    ),
    EventCategoryModel(
      id: "meeting",
      name: "Meeting",
      image: Appassets.meetingCateLight,
      darkImage: Appassets.meetingCateDark,
      iconData: Icons.meeting_room_outlined,
    ),
  ];

  int _currentIndex = 0;
  DateTime? selectedEventDate;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.event != null) {
      titleController.text = widget.event!.eventTitle;
      descController.text = widget.event!.eventDescription;
      selectedEventDate = widget.event!.eventDate;
      _currentIndex = categories.indexWhere(
            (element) => element.id == widget.event!.eventCategoryId,
      );
      if (_currentIndex == -1) _currentIndex = 0;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
        ),
        centerTitle: true,
        title: Text(
          widget.event != null ? "Edit Event" : "Add Event",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    categories[_currentIndex].image,
                    width: double.infinity,
                    height: height * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 16),

                /// 2. Tabs for Categories
                DefaultTabController(
                  length: categories.length,
                  initialIndex: _currentIndex,
                  child: TabBar(
                    onTap: (index) {
                      setState(() => _currentIndex = index);
                    },
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    indicator: const BoxDecoration(),
                    tabAlignment: TabAlignment.start,
                    labelPadding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    tabs: categories.map((category) {
                      return TabWidgetItem(
                        eventCategoryModel: category,
                        isSelected: _currentIndex == categories.indexOf(category),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 20),

                /// 3. Title Field
                const Text("Title", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Customtextformfield(
                  hintText: "Event Title",
                  controller: titleController,
                  onPressed: () {},
                  validator: (value) => (value == null || value.trim().isEmpty) ? "Please enter title" : null,
                ),

                const SizedBox(height: 10),

                /// 4. Description Field
                const Text("Description", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Customtextformfield(
                  hintText: "Event Description",
                  maxLines: 4,
                  controller: descController,
                  onPressed: () {},
                  validator: (value) => (value == null || value.trim().isEmpty) ? "Please enter description" : null,
                ),

                const SizedBox(height: 10),

                /// 5. Date Picker Row
                Row(
                  children: [
                    const Icon(Icons.calendar_month, color: Appcolors.primaryColor),
                    const SizedBox(width: 8),
                    const Expanded(child: Text("Event Date", style: TextStyle(fontSize: 16))),
                    TextButton(
                      onPressed: getSelectedDate,
                      child: Text(
                        selectedEventDate != null
                            ? DateFormat('dd, MMM, yyyy').format(selectedEventDate!)
                            : "Choose Date",
                        style: const TextStyle(
                          color: Appcolors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// 6. Save or Update
                Customelevatedbutton(
                  onPressed: handleSave,
                  backgroundColor: Appcolors.primaryColor,
                  buttonName: widget.event != null ? "Update Event" : "Add Event",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleSave() {
    if (_formKey.currentState!.validate()) {
      if (selectedEventDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please select a date")),
        );
        return;
      }

      EvenDataModel data = EvenDataModel(
        eventId: widget.event?.eventId ?? "",
        eventTitle: titleController.text,
        eventDescription: descController.text,
        eventDate: selectedEventDate!,
        eventCategoryId: categories[_currentIndex].id,
        categoryImage: categories[_currentIndex].image,
        categoryDarkImage: categories[_currentIndex].darkImage,
        isFavorite: widget.event?.isFavorite ?? false,
      );

      if (widget.event != null) {
        FirestoreUtils.updateEvent(data);
      } else {
        FirestoreUtils.addEvent(data);
      }

      Navigator.pop(context);
    }
  }

  void getSelectedDate() async {
    var date = await showDatePicker(
      context: context,
      initialDate: selectedEventDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) setState(() => selectedEventDate = date);
  }
}
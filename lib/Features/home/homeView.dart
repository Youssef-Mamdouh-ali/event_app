import 'package:event_app/Features/home/Widget/event_card_item.dart';
import 'package:event_app/Features/home/Widget/tab_widget_item.dart';
import 'package:event_app/core/app_provider/app_settings_provider.dart';
import 'package:event_app/models/event_category_model.dart';
import 'package:event_app/models/event_data_model.dart';
import 'package:event_app/utils/appAssets.dart';
import 'package:event_app/utils/appColors.dart';
import 'package:event_app/utils/firestore/firestore_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  List<EventCategoryModel> categories = [
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

  int currentindex = 0 ;

  @override
  Widget build(BuildContext context) {
    ///  Provider
    final appSettingsProvider = Provider.of<AppSettingsProvider>(context);

    /// Responsive screen
    late var height = MediaQuery.of(context).size.height;
    late var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back ✨",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 16),
              ),
              Text(
                "Yossef Mamdouh",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                if (appSettingsProvider.currentTheme == ThemeMode.light) {
                  appSettingsProvider.changeTheme(ThemeMode.dark);
                } else {
                  appSettingsProvider.changeTheme(ThemeMode.light);
                }
              },
              icon: Icon(
                appSettingsProvider.currentTheme == ThemeMode.light
                    ? Icons.light_mode
                    : Icons.nightlight_outlined,
                size: 24,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (appSettingsProvider.currentLanguage == "en") {
                  appSettingsProvider.changeLanguage("ar");
                } else {
                  appSettingsProvider.changeLanguage("en");
                }
              },
              child: Container(
                // padding: EdgeInsets.all(8.0),
                height: height * 0.04,
                width: width * 0.12,
                decoration: BoxDecoration(
                  color: Appcolors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    appSettingsProvider.currentLanguage[0].toUpperCase() +
                        appSettingsProvider.currentLanguage.substring(1),
                    style: TextStyle(
                      color: Appcolors.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: height * 0.02),
            /// default tab bar
            DefaultTabController(
              length:categories.length,
              child: TabBar(
                onTap: (index){
                  currentindex = index ;
                  setState(() {

                  });
                },
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(),
                tabAlignment: TabAlignment.start,
                labelPadding: EdgeInsets.symmetric(horizontal: width * 0.02),
                tabs: categories.map((data){
                return TabWidgetItem(eventCategoryModel: data,isSelected: currentindex ==  categories.indexOf(data) ? true: false) ;
                }).toList()
              ),
            ),
            SizedBox(height: height * 0.02),
            /// get stream data
            StreamBuilder(stream: FirestoreUtils.getStreamDataFromFirestore(categories[currentindex].id), builder: (context, snapshot) {
              if(snapshot.hasError){
                return Text(snapshot.error.toString(), style: TextStyle(color: Colors.red),) ;
              }

              if(snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator() ;
              }

              List<EvenDataModel> dataList = snapshot.data!.docs.map((e) {
                return e.data() ;
              },).toList();
              return dataList.isEmpty ? Text("no data found") : Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return EventCardItem(dataModel: dataList[index],);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: height * 0.015);
                  },
                  itemCount: dataList.length,
                ),
              ) ;
            },)
          ],
        ),
      ),
    );
  }
}

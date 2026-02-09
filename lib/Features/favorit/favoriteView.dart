import 'package:event_app/Features/home/Widget/event_card_item.dart';
import 'package:event_app/core/widgets/customTextFormField.dart';
import 'package:event_app/models/event_data_model.dart';
import 'package:event_app/utils/firestore/firestore_utils.dart';
import 'package:flutter/material.dart';

class Favoriteview extends StatefulWidget {
  const Favoriteview({super.key});

  @override
  State<Favoriteview> createState() => _FavoriteviewState();
}

class _FavoriteviewState extends State<Favoriteview> {
  @override
  Widget build(BuildContext context) {
    /// Responsive screen
    late var height = MediaQuery.of(context).size.height;
    late var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        spacing: 16,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Customtextformfield(onPressed: (){},hintText: "Search",prefixIcon: Icon(Icons.search),),
          ),
          StreamBuilder(
            stream: FirestoreUtils.getStreamFavoriteData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(
                  snapshot.error.toString(),
                  style: TextStyle(color: Colors.red),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              List<EvenDataModel> dataList = snapshot.data!.docs.map((e) {
                return e.data();
              }).toList();
              return dataList.isEmpty
                  ? Text("no data found")
                  : Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return EventCardItem(dataModel: dataList[index]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: height * 0.015);
                        },
                        itemCount: dataList.length,
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}

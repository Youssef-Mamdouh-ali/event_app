class EvenDataModel {
  static const String collectionName ="EventCollection";

   String? eventId;

  final String eventTitle;

  final String eventDescription;

  final DateTime eventDate;

  final String eventCategoryId;

  final String categoryImage;

  final String categoryDarkImage;

  bool isFavorite;

  EvenDataModel({
    this.eventId,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventDate,
    required this.eventCategoryId,
    required this.categoryImage,
    required this.categoryDarkImage,
    this.isFavorite = false,
  });

  factory EvenDataModel.fromFireStore(Map<String, dynamic> json) {
    return EvenDataModel(
      eventId: json["eventId"],
      eventTitle: json["eventTitle"],
      eventDescription: json["eventDescription"],
      eventDate: DateTime.fromMillisecondsSinceEpoch(json["eventDate"]),
      eventCategoryId: json["eventCategoryId"],
      categoryImage: json["categoryImage"],
      categoryDarkImage: json["categoryDarkImage"],
      isFavorite: json["isFavorite"],
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      "eventId": eventId,
      "eventTitle": eventTitle,
      "eventDescription": eventDescription,
      "eventDate": eventDate.millisecondsSinceEpoch,
      "eventCategoryId": eventCategoryId,
      "categoryImage": categoryImage,
      "categoryDarkImage": categoryDarkImage,
      "isFavorite": isFavorite,
    };
  }
}

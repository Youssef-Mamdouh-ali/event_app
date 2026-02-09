import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/models/event_data_model.dart';

abstract class FirestoreUtils {
  /// get reference
  static CollectionReference<EvenDataModel> getCollectionRef() {
    return FirebaseFirestore.instance
        .collection(EvenDataModel.collectionName)
        .withConverter<EvenDataModel>(
          fromFirestore: (snapshot, _) =>
              EvenDataModel.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toFireStore(),
        );
  }

  /// add event
  static Future<void> addEvent(EvenDataModel data) async {
    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc();
    data.eventId = docRef.id;
    docRef.set(data);
  }

  /// get data from fireStore
  static Future<List<EvenDataModel>> getDataFromFirestore() async {
    List<EvenDataModel> eventList = [];
    var collectionRef = getCollectionRef();
    var data = await collectionRef.get();
    data.docs.map((element) {
      eventList.add(element.data());
    }).toList();
    return eventList ;
  }

  static Stream<QuerySnapshot<EvenDataModel>> getStreamDataFromFirestore (String categoryId) {
    var collectionRef = getCollectionRef().where("eventCategoryId",isEqualTo: categoryId );
    return collectionRef.snapshots();
  }


  static Stream<QuerySnapshot<EvenDataModel>> getStreamFavoriteData () {
    var collectionRef = getCollectionRef().where("isFavorite",isEqualTo: true );
    return collectionRef.snapshots();
  }
/// update
  static Future<void> updateEvent (EvenDataModel data) async{
    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc(data.eventId);
    docRef.update(data.toFireStore());
  }

  /// delete
  static Future<void> deleteEvent(String eventId) async {
    var collectionRef = getCollectionRef();
    await collectionRef.doc(eventId).delete();
  }
}

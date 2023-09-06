import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weddingo/data_base/hall.dart';

class MyDataBase {
  static CollectionReference<Hall> getHallsCollection() {
    var hallsCollections = FirebaseFirestore.instance
        .collection('halls')
        .withConverter<Hall>(
            fromFirestore: (snapshot, options) =>
                Hall.FromFirestore(snapshot.data()!),
            toFirestore: (hall, options) => hall.ToFirestore());
    return hallsCollections;
  }

   static Stream<QuerySnapshot<Hall>> getHallsRealTieUpdates(String x)  {
    var querySnapShot = getHallsCollection().where('PrimaryLocation',isEqualTo:x).snapshots();
    return querySnapShot;
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addData(int number) async {
    final now = DateTime.now();
    final formattedDate = '${now.year}-${now.month}-${now.day}';
    final formattedTime = now.millisecondsSinceEpoch.toString();

    final data = {
      'number': number,
      'date': formattedDate,
      'time': formattedTime,
    };

    final collection = _firestore.collection(formattedDate);
    final document = collection.doc(formattedTime);

    await document.set(data).then(
          (value) => print("data added"),
        );
    notifyListeners();
  }
}

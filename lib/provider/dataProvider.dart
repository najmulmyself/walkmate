import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataProvider with ChangeNotifier {
  int totalstep = 0;
  double _sliderValue = 500;
  int remainingStep = 0;

  double get sliderValue => _sliderValue;

  getSliderValue(double value) {
    _sliderValue = value;
    notifyListeners();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String getDateNow() {
    final now = DateTime.now();
    final formattedDate = '${now.year}-${now.month}-${now.day}';
    return formattedDate;
  }

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
      (value) {
        // calculateStep(number);
        print("data added");
      },
    ).onError(
      (error, stackTrace) {
        print(error);
      },
    );
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> getData(String formattedDate) async {
    final collection = _firestore.collection(formattedDate);

    try {
      final querySnapshot = await collection.get();
      final data = querySnapshot.docs.map((doc) => doc.data()).toList();
      // calculateStep(data);
      return data;
    } catch (error) {
      print("Error getting data: $error");
      return [];
    }
  }

   getStep(String formattedDate) async {
    totalstep = 0;
    final collection = _firestore.collection(formattedDate);

    try {
      final querySnapshot = await collection.get();
      final data = querySnapshot.docs.map((docs) => docs.data()).toList();
      for (var element in data) {
        calculateStep(element['number']);
      }
    } catch (error) {
      print("Error fetching data $error");
    }
  }

  calculateStep(int step) {
    totalstep = totalstep + step;
    remainingStep = (sliderValue - totalstep).toInt();
  }
}


  // notifyListeners();


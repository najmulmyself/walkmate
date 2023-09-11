import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:walkmate/provider/notificationProvider.dart';

class DataProvider with ChangeNotifier {
  BuildContext context;

  DataProvider(this.context);
  int _totalstep = 0;
  int get totalStep => _totalstep;
  double _sliderValue = 0;
  int remainingStep = 0;

  double get sliderValue => _sliderValue;



  getSliderValue(double value) {
    _sliderValue = value;
    // getStep(getDateNow());

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
    _totalstep = 0;
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
    _totalstep = _totalstep + step;
    remainingStep = (sliderValue - _totalstep).toInt();
    notifyListeners();
  }

  congratulate() {
    final notificationP = Provider.of<NotificationProvider>(context);
    if (remainingStep == 0) {
      notificationP.showCongratulatoryNotification();
    }
  }
}


  // notifyListeners();


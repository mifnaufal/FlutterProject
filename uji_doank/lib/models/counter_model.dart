// lib/models/counter_model.dart
import 'package:flutter/foundation.dart'; // Untuk @required atau @visibleForTesting

class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // Memberitahu semua listener bahwa state telah berubah
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
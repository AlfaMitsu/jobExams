import 'package:flutter/material.dart';

import '../../../../core/api_service.dart';
import '../models/person_model.dart';

class PersonProvider with ChangeNotifier {
  final List<Person> _persons = [];
  bool _isLoading = false;
  int _page = 1;
  final int _limit = 20;
  bool _hasMoreData = true;

  List<Person> get persons => _persons;
  bool get isLoading => _isLoading;
  bool get hasMoreData => _hasMoreData;

  void fetchPersons() async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      final newPersons = await ApiService().fetchPersons(_limit);
      if (newPersons.isEmpty) {
        _hasMoreData = false;
      } else {
        _persons.addAll(newPersons);
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void refreshPersons() {
    _persons.clear();
    _page = 1;
    _hasMoreData = true;
    fetchPersons();
  }
}

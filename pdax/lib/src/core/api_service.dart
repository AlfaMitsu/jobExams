import 'dart:convert';
import 'package:http/http.dart' as http;

import '../featutres/home/data/models/person_model.dart';

class ApiService {
  static const String apiUrl = 'https://fakerapi.it/api/v1/persons';

  Future<List<Person>> fetchPersons(int count) async {
    final response = await http.get(Uri.parse('$apiUrl?_quantity=$count'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['data'] as List).map((json) => Person.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load persons');
    }
  }
}

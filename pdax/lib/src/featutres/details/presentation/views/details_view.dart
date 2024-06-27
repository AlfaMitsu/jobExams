import 'package:flutter/material.dart';

import '../../../home/data/models/person_model.dart';

class DetailsView extends StatelessWidget {
  final Person person;

  const DetailsView({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(person.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              person.imageUrl,
              errorBuilder: (context, error, stackTrace) {
                return Image.network('https://via.placeholder.com/150');
              },
            ),
            const SizedBox(height: 16),
            Text('Name: ${person.name}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Email: ${person.email}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

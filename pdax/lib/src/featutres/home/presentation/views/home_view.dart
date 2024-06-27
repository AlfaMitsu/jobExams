import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../details/presentation/views/details_view.dart';
import '../../data/repositories/person_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        Provider.of<PersonProvider>(context, listen: false).fetchPersons();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PersonProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount:
                  provider.persons.length + (provider.hasMoreData ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == provider.persons.length) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final person = provider.persons[index];
                return ListTile(
                  leading: Image.network(
                    person.imageUrl,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network('https://via.placeholder.com/150');
                    },
                  ),
                  title: Text(person.name),
                  subtitle: Text(person.email),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsView(person: person),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          if (!provider.hasMoreData)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('No more data'),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: provider.refreshPersons,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

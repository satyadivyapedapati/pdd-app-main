import 'package:flutter/material.dart';

class SearchResultScreen extends StatelessWidget {
  static const String routeName = '/searchresult';

  final List<Map<String, dynamic>> searchResults;

  SearchResultScreen({required this.searchResults});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: Container(
        color: Colors.lightGreen[100], // Background color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Search Results',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), // Text style
              ),
            ),
            Expanded(
              child: searchResults.isEmpty
                  ? Center(
                      child: Text(
                        'No results found.',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    )
                  : ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final item = searchResults[index];
                        return Card(
                          color: Colors.green[200], // Changed list item background color
                          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: ListTile(
                            title: Text(
                              'Acno: ${item['acno']}',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Updated text style for list item title
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Accession: ${item['accession']}',
                                  style: TextStyle(color: Colors.white), // Updated text style for list item subtitle
                                ),
                                Text(
                                  'Cultivator Name: ${item['cultivar_name']}',
                                  style: TextStyle(color: Colors.white), // Updated text style for list item subtitle
                                ),
                                Text(
                                  'Country: ${item['origin_country']}',
                                  style: TextStyle(color: Colors.white), // Updated text style for list item subtitle
                                ),
                                Text(
                                  'Province: ${item['origin_province']}',
                                  style: TextStyle(color: Colors.white), // Updated text style for list item subtitle
                                ),
                                Text(
                                  'City: ${item['origin_city']}',
                                  style: TextStyle(color: Colors.white), // Updated text style for list item subtitle
                                ),
                                Text(
                                  'Pedigree: ${item['e_pedigree']}',
                                  style: TextStyle(color: Colors.white), // Updated text style for list item subtitle
                                ),
                                Text(
                                  'Genus: ${item['e_genus']}',
                                  style: TextStyle(color: Colors.white), // Updated text style for list item subtitle
                                ),
                                Text(
                                  'Species: ${item['e_species']}',
                                  style: TextStyle(color: Colors.white), // Updated text style for list item subtitle
                                ),
                                Text(
                                  'Breeder: ${item['e_breeder_or_collector']}',
                                  style: TextStyle(color: Colors.white), // Updated text style for list item subtitle
                                ),
                                // Add other fields as needed...
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Search Result Demo',
    home: SearchResultScreen(searchResults: []), // Pass an empty list initially
  ));
}

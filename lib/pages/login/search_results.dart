import 'package:flutter/material.dart';

class SearchResultScreen extends StatelessWidget {
  static const String routeName = '/searchresult';

  @override
  Widget build(BuildContext context) {
    // Dummy data for testing purposes
    List<Map<String, String>> dummySearchResults = [
      {
        'Acno': 'AC001',
        'Accession': 'Accession 001',
        'CultivatorName': 'Cultivator 1',
        'Country': 'CA',
        'Province': 'ON',
        'City': 'Toronto',
        'Pedigree': 'Pedigree 1',
        'Genus': 'Genus 1',
        'Species': 'Species 1',
        'Breeder': 'Breeder 1'
      },
      {
        'Acno': 'AC002',
        'Accession': 'Accession 002',
        'CultivatorName': 'Cultivator 2',
        'Country': 'CA',
        'Province': 'BC',
        'City': 'Delta',
        'Pedigree': 'Pedigree 2',
        'Genus': 'Genus 2',
        'Species': 'Species 2',
        'Breeder': 'Breeder 2'
      },
    ];

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
              child: ListView.builder(
                itemCount: dummySearchResults.length,
                itemBuilder: (context, index) {
                  final item = dummySearchResults[index];
                  return Card(
                    color: Colors.green[200], // Changed list item background color
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: ListTile(
                      title: Text(
                        'Acno: ${item['Acno']}',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Updated text style for list item title
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Accession: ${item['Accession']}',
                            style: TextStyle(color: Colors.white), // Updated text style for list item subtitle
                          ),
                          Text(
                            'Cultivator Name: ${item['CultivatorName']}',
                            style: TextStyle(color: Colors.white), // Updated text style for list item subtitle
                          ),
                          Text(
                            'Country: ${item['Country']}',
                            style: TextStyle(color: Colors.white), // Updated text style for list item subtitle
                          ),
                          Text(
                            'Province: ${item['Province']}',
                            style: TextStyle(color: Colors.white), // Updated text style for list item subtitle
                          ),
                          Text(
                            'City: ${item['City']}',
                            style: TextStyle(color: Colors.white), // Updated text style for list item subtitle
                          ),
                          Text(
                            'Pedigree: ${item['Pedigree']}',
                            style: TextStyle(color: Colors.white), // Updated text style for list item subtitle
                          ),
                          Text(
                            'Genus: ${item['Genus']}',
                            style: TextStyle(color: Colors.white), // Updated text style for list item subtitle
                          ),
                          Text(
                            'Species: ${item['Species']}',
                            style: TextStyle(color: Colors.white), // Updated text style for list item subtitle
                          ),
                          Text(
                            'Breeder: ${item['Breeder']}',
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
    home: SearchResultScreen(),
  ));
}

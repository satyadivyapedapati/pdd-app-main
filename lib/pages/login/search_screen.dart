import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plant_disease_detector/pages/login/search_results.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = '/search';

  // Update this with your actual API endpoint
  static const String apiUrl = 'https://search-orchard-guard-ow7eqo2vkmw47bwlnbasc6a2ce.us-east-2.es.amazonaws.com/_search';

  Future<List<Map<String, dynamic>>> fetchData(Map<String, dynamic> searchData) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Basic TGF2YW55YTpPcmNoYXJkZ3VhcmRAMDQ=', // Update with your actual Authorization header
      },
      body: jsonEncode(searchData),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> hits = data['hits']['hits'];
      return hits.map((hit) => hit['_source'] as Map<String, dynamic>).toList();
    } else {
      // API call failed, handle the error
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController acnoController = TextEditingController();
    TextEditingController accessionController = TextEditingController();
    TextEditingController cultivatorNameController = TextEditingController();
    TextEditingController pedigreeController = TextEditingController();
    TextEditingController genusController = TextEditingController();
    TextEditingController speciesController = TextEditingController();
    TextEditingController breederController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Search Criteria',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: acnoController,
                  decoration: InputDecoration(
                    labelText: 'Acno',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: accessionController,
                  decoration: InputDecoration(
                    labelText: 'Accession',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: cultivatorNameController,
                  decoration: InputDecoration(
                    labelText: 'Cultivator Name',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: pedigreeController,
                  decoration: InputDecoration(
                    labelText: 'Pedigree',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: genusController,
                  decoration: InputDecoration(
                    labelText: 'Genus',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: speciesController,
                  decoration: InputDecoration(
                    labelText: 'Species',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: breederController,
                  decoration: InputDecoration(
                    labelText: 'Breeder',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final Map<String, dynamic> searchData = {
                          "size": 20,
                          "query": {
                            "query_string": {
                              "query": _buildSearchQuery(
                                acno: acnoController.text,
                                accession: accessionController.text,
                                cultivatorName: cultivatorNameController.text,
                                pedigree: pedigreeController.text,
                                genus: genusController.text,
                                species: speciesController.text,
                                breeder: breederController.text,
                              ),
                            }
                          }
                        };

                        try {
                          final List<Map<String, dynamic>> searchResults = await fetchData(searchData);

                          // Navigate to SearchResultScreen and pass the fetched data
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchResultScreen(searchResults: searchResults),
                            ),
                          );
                        } catch (e) {
                          // Handle API call errors
                          print('Error: $e');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Failed to fetch data. Please try again.'),
                            ),
                          );
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green[900]!),
                    ),
                    child: Text('Search', style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.lightGreen[100],
    );
  }

  // Function to build the search query
  String _buildSearchQuery({
    String acno = '',
    String accession = '',
    String cultivatorName = '',
    String pedigree = '',
    String genus = '',
    String species = '',
    String breeder = '',
  }) {
    List<String> queryParts = [];
    if (acno.isNotEmpty) queryParts.add('acno:"$acno"');
    if (accession.isNotEmpty) queryParts.add('accession:"$accession"');
    if (cultivatorName.isNotEmpty) queryParts.add('cultivar_name:"$cultivatorName"');
    if (pedigree.isNotEmpty) queryParts.add('e_pedigree:"$pedigree"');
    if (genus.isNotEmpty) queryParts.add('e_genus:"$genus"');
    if (species.isNotEmpty) queryParts.add('e_species:"$species"');
    if (breeder.isNotEmpty) queryParts.add('e_breeder_or_collector:"$breeder"');

    return queryParts.join(' AND ');
  }
}

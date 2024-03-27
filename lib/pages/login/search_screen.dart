import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plant_disease_detector/pages/login/search_results.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = '/search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController acnoController = TextEditingController();
  TextEditingController accessionController = TextEditingController();
  TextEditingController cultivatorNameController = TextEditingController();
  TextEditingController pedigreeController = TextEditingController();
  TextEditingController genusController = TextEditingController();
  TextEditingController speciesController = TextEditingController();
  TextEditingController breederController = TextEditingController();
  String queryOperator = 'OR'; // Default query operator

  static const String apiUrl = 'https://search-orchard-guard-u3idobrg65ufwwpx3q4j4eesk4.us-east-1.es.amazonaws.com/_search';

  Future<List<Map<String, dynamic>>> fetchData(Map<String, dynamic> searchData) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Basic b3JjaGFyZC1ndWFyZDpPcmNoYXJkZ3VhcmRAMDQ=', // Update with your actual Authorization header
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Screen'),
      ),
      body: Stack(
        children: [
          // Background Image
          Opacity(
            opacity: 0.9,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/1.jpg'), // Path to your background image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7), // White color with opacity
                    borderRadius: BorderRadius.circular(20),
                  ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                queryOperator = 'OR';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: queryOperator == 'OR' ? Colors.green : Colors.transparent,
                             // onPrimary: queryOperator == 'OR' ? Colors.white : Colors.black,
                            ),
                            child: Text('OR'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                queryOperator = 'AND';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: queryOperator == 'AND' ? Colors.green : Colors.transparent,
                             // onPrimary: queryOperator == 'AND' ? Colors.white : Colors.black,
                            ),
                            child: Text('AND'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final Map<String, dynamic> searchData = {
                                "size": 100,
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
                                      operator: queryOperator,
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
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 226, 100, 123),
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          ),
                         
                          child: Text('Search', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build the search query
  String _buildSearchQuery({
    required String acno,
    required String accession,
    required String cultivatorName,
    required String pedigree,
    required String genus,
    required String species,
    required String breeder,
    required String operator,
  }) {
    List<String> queryParts = [];
    if (acno.isNotEmpty) queryParts.add('acno:"$acno"');
    if (accession.isNotEmpty) queryParts.add('accession:"$accession"');
    if (cultivatorName.isNotEmpty) queryParts.add('cultivar_name:"$cultivatorName"');
    if (pedigree.isNotEmpty) queryParts.add('e_pedigree:"$pedigree"');
    if (genus.isNotEmpty) queryParts.add('e_genus:"$genus"');
    if (species.isNotEmpty) queryParts.add('e_species:"$species"');
    if (breeder.isNotEmpty) queryParts.add('e_breeder_or_collector:"$breeder"');

    String finalQuery = queryParts.join(' $operator ');

    return finalQuery;
  }
}

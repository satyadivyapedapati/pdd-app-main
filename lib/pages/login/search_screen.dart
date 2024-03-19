import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plant_disease_detector/pages/login/search_results.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = '/search';

  Future<List<Map<String, String>>> fetchData() async {
    final response = await http.get(Uri.parse('your-api-url'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => (item as Map<String, dynamic>).cast<String, String>()).toList();
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
                    labelText: 'Acno*',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 18),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Acno';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: accessionController,
                  decoration: InputDecoration(
                    labelText: 'Accession*',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 18),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Accession';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: cultivatorNameController,
                  decoration: InputDecoration(
                    labelText: 'Cultivator Name*',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 18),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Cultivator Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: pedigreeController,
                  decoration: InputDecoration(
                    labelText: 'Pedigree*',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 18),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Pedigree';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: genusController,
                  decoration: InputDecoration(
                    labelText: 'Genus*',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 18),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Genus';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: speciesController,
                  decoration: InputDecoration(
                    labelText: 'Species*',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 18),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Species';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: breederController,
                  decoration: InputDecoration(
                    labelText: 'Breeder*',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 18),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Breeder';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      // Use this after fetching the data and pass to the next screen
                      // if (_formKey.currentState!.validate()) {
                      //   final List<Map<String, String>> searchData = await fetchData();

                      //   // Navigate to SearchResultScreen and pass the fetched data
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => SearchResultScreen(searchResults: searchData),
                      //     ),
                      //   );
                      // }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchResultScreen(),
                        ),
                      );
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
}

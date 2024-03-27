import 'dart:io';
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';

class SearchResultScreen extends StatelessWidget {
  static const String routeName = '/searchresult';

  final List<Map<String, dynamic>> searchResults;

  SearchResultScreen({required this.searchResults});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predictions'),
        backgroundColor: Color.fromARGB(255, 226, 100, 123), // App bar background color
      ),
      body: Container(
        color: Colors.white, // Background color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Search Results',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 226, 100, 123)), // Text style
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final excel = Excel.createExcel();
                      final sheet = excel['Sheet1'];

                      // Add headers
                      sheet.appendRow([
                         'Acno',
      'Accession',
      'Cultivar Name',
      'SD Moved',
      'SD New',
      'E Locality',
      'Cmt',
      'SD Unique',
      'Site',
      'IVT',
      'Why Null',
      'Origin Country',
      'Origin Province',
      'Origin City',
      'Collector',
      'Breeder',
      'Loc1',
      'Loc2',
      'Loc3',
      'Loc4',
      'Location Field',
      'Location Greenhouse',
      'Distribute',
      'Status',
      'Alive',
      'Statcmt',
      'Plant Type',
      'Taxno',
      'Sitecmt',
      'ACP',
      'E Pedigree',
      'E Genus',
      'E Species',
      'E Subspecies',
      'E Habita',
      'E Cmt',
      'E Quant',
      'E Units',
      'E Cform',
      'E Plants Collected',
      'E Released',
      'E Datefmt',
      'E Lath',
      'E Latd',
      'E Latm',
      'E Lonh',
      'E Lond',
      'E Lonm',
      'E Lons',
      'E Lats',
      'E Elev',
      'Family',
      'E Breeder or Collector',
      'M Transfer History',
      'E Origin Institute',
      'E Origin Address1',
      'E Origin Address2',
      'E Origin Postal Code',
      'E Date Collected',
      'Acimpt',
      'Uniform',
    ]);
                        // Add other headers...
                      

                      // Add data rows
                      for (final item in searchResults) {
                        sheet.appendRow([
        item['acno'],
        item['accession'],
        item['cultivar_name'],
        item['sd_moved'],
        item['sd_new'],
        item['e_locality'],
        item['cmt'],
        item['sd_unique'],
        item['site'],
        item['ivt'],
        item['whynull'],
        item['origin_country'],
        item['origin_province'],
        item['origin_city'],
        item['collector'],
        item['breeder'],
        item['loc1'],
        item['loc2'],
        item['loc3'],
        item['loc4'],
        item['location_field'],
        item['location_greenhouse'],
        item['distribute'],
        item['status'],
        item['alive'],
        item['statcmt'],
        item['plant_type'],
        item['taxno'],
        item['sitecmt'],
        item['acp'],
        item['e_pedigree'],
        item['e_genus'],
        item['e_species'],
        item['e_subspecies'],
        item['e_habita'],
        item['e_cmt'],
        item['e_quant'],
        item['e_units'],
        item['e_cform'],
        item['e_plants_collected'],
        item['e_released'],
        item['e_datefmt'],
        item['e_lath'],
        item['e_latd'],
        item['e_latm'],
        item['e_lonh'],
        item['e_lond'],
        item['e_lonm'],
        item['e_lons'],
        item['e_lats'],
        item['e_elev'],
        item['family'],
        item['e_breeder_or_collector'],
        item['m_transfer_history'],
        item['e_origin_institute'],
        item['e_origin_address1'],
        item['e_origin_address2'],
        item['e_origin_postal_code'],
        item['e_date_collected'],
        item['acimpt'],
        item['uniform'],
      ]);
                      }

                      // Get the document directory using path_provider
                      final directory = '/storage/emulated/0/Download';
                      // final downloadsPath = directory!.path;

                      // Generate a unique file name
                      final fileName = 'search_results_${DateTime.now().millisecondsSinceEpoch}.xlsx';
                      final filePath = '$directory/$fileName';

                      // Save the Excel file
                      File(filePath).writeAsBytesSync(excel.encode()!);// Add the non-null assertion operator here

                      // Show a snackbar indicating export success
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Exported to: $filePath'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Color.fromARGB(255, 226, 100, 123),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        'Export data to Excel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: searchResults.isEmpty
                  ? Center(
                      child: Text(
                        'No results found.',
                        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 226, 100, 123)),
                      ),
                    )
                  : ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final item = searchResults[index];
                        return Card(
                          color: Color.fromARGB(255, 226, 100, 123).withOpacity(0.4), // Changed list item background color
                          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: ListTile(
                            title: Text(
                              'Acno: ${item['acno']}',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), // Updated text style for list item title
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Accession: ${item['accession']}',
                                  style: TextStyle(color: Colors.black), // Updated text style for list item subtitle
                                ),
                                Text(
                                  'Cultivator Name: ${item['cultivar_name']}',
                                  style: TextStyle(color: Colors.black), // Updated text style for list item subtitle
                                ),
                                Text(
                                  'Country: ${item['origin_country']}',
                                  style: TextStyle(color: Colors.black), // Updated text style for list item subtitle
                                ),
                                Text(
                                  'Province: ${item['origin_province']}',
                                  style: TextStyle(color: Colors.black), // Updated text style for list item subtitle
                                ),
                                Text(
                                  'City: ${item['origin_city']}',
                                  style: TextStyle(color: Colors.black), // Updated text style for list item subtitle
                                ),
                                Text(
                                  'Pedigree: ${item['e_pedigree']}',
                                  style: TextStyle(color: Colors.black), // Updated text style for list item subtitle
                                ),
                                Text(
                                  'Genus: ${item['e_genus']}',
                                  style: TextStyle(color: Colors.black), // Updated text style for list item subtitle
                                ),
                                Text(
                                  'Species: ${item['e_species']}',
                                  style: TextStyle(color: Colors.black), // Updated text style for list item subtitle
                                ),
                                Text(
                                  'Breeder: ${item['e_breeder_or_collector']}',
                                  style: TextStyle(color: Colors.black), // Updated text style for list item subtitle
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

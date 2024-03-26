import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_disease_detector/pages/home/about_us.dart';
import 'package:plant_disease_detector/pages/home/image_picker.dart';
import 'package:plant_disease_detector/pages/login/login_screen.dart';
import 'package:plant_disease_detector/pages/login/search_screen.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});
    static const String routeName = '/contactinfo';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Text(
              'O',
              style: GoogleFonts.gabarito(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 28,
              ),
            ),
            Text(
              'RCHARD',
              style: GoogleFonts.gabarito(
                fontWeight: FontWeight.w600,
                fontSize: 28,
              ),
            ),
            Text(
              ' G',
              style: GoogleFonts.gabarito(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 28,
              ),
            ),
            Text(
              'UARD',
              style: GoogleFonts.gabarito(
                fontWeight: FontWeight.w600,
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
      // drawer: const NavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  'CONTACT',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.gabarito(
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'INFO',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.gabarito(
                    color: Colors.red.shade700,
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      size: 32,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.gabarito(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '+1 123 123 1234',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.gabarito(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      size: 32,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.gabarito(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'info@email.com',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.gabarito(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.house_outlined,
                      size: 32,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.gabarito(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Address, Address, Address',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.gabarito(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green[900],
            ),
            child: const Text(
              'Welcome',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ImagePickerScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Search'),
            onTap: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('About Us'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUs(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Contact Info'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactInfo(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, LoginScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_disease_detector/pages/home/contact_info.dart';
import 'package:plant_disease_detector/pages/home/image_picker.dart';
import 'package:plant_disease_detector/pages/login/login_screen.dart';
import 'package:plant_disease_detector/pages/login/search_screen.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});
    static const String routeName = '/aboutus';


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
              height: 32,
            ),
            Row(
              children: [
                Text(
                  'ABOUT',
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
                  'U',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.gabarito(
                    color: Colors.red.shade700,
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                  ),
                ),
                Text(
                  'S',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.gabarito(
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [
                          0.1,
                          0.2,
                          0.3,
                        ],
                        colors: [
                          Colors.grey.shade700,
                          Colors.grey.shade800,
                          Colors.grey.shade900,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Manish",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.gabarito(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At risus viverra adipiscing at in. Ultricies integer quis auctor elit. Vel facilisis volutpat est velit egestas dui id.",
                            style: GoogleFonts.gabarito(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [
                          0.1,
                          0.2,
                          0.3,
                        ],
                        colors: [
                          Colors.grey.shade700,
                          Colors.grey.shade800,
                          Colors.grey.shade900,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lavanya',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.gabarito(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At risus viverra adipiscing at in. Ultricies integer quis auctor elit. Vel facilisis volutpat est velit egestas dui id.",
                            style: GoogleFonts.gabarito(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [
                          0.1,
                          0.2,
                          0.3,
                        ],
                        colors: [
                          Colors.grey.shade700,
                          Colors.grey.shade800,
                          Colors.grey.shade900,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Divya',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.gabarito(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At risus viverra adipiscing at in. Ultricies integer quis auctor elit. Vel facilisis volutpat est velit egestas dui id.",
                            style: GoogleFonts.gabarito(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [
                          0.1,
                          0.2,
                          0.3,
                        ],
                        colors: [
                          Colors.grey.shade700,
                          Colors.grey.shade800,
                          Colors.grey.shade900,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vinisha',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.gabarito(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At risus viverra adipiscing at in. Ultricies integer quis auctor elit. Vel facilisis volutpat est velit egestas dui id.",
                            style: GoogleFonts.gabarito(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [
                          0.1,
                          0.2,
                          0.3,
                        ],
                        colors: [
                          Colors.grey.shade700,
                          Colors.grey.shade800,
                          Colors.grey.shade900,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Anika',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.gabarito(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At risus viverra adipiscing at in. Ultricies integer quis auctor elit. Vel facilisis volutpat est velit egestas dui id.",
                            style: GoogleFonts.gabarito(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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

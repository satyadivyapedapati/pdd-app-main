import 'dart:ffi';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_disease_detector/pages/home/about_us.dart';
import 'package:plant_disease_detector/pages/home/contact_info.dart';
import 'package:plant_disease_detector/pages/login/login_screen.dart';
import 'package:plant_disease_detector/pages/login/search_screen.dart';
import 'package:tflite_v2/tflite_v2.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  XFile? image;
  List<dynamic>? _recognitions;
  bool isPredictPressed = false;

  Map<String, String> labelDescriptions = {
    'Apple Scab': 'Apple scab is a common disease that affects apple trees, '
        'caused by the fungus Venturia inaequalis. It results in dark, '
        'scabby spots on leaves and fruit, leading to defoliation and '
        'reduced fruit quality.',
    'Apple Powdery Mildew': 'Apple powdery mildew is a fungal disease caused '
        'by Podosphaera leucotricha. It appears as white, powdery patches '
        'on leaves, shoots, and fruit, affecting growth and fruit development.',
    'Apple Black Rot': 'Apple black rot, caused by the fungus Botryosphaeria '
        'obtusa, is a serious disease affecting apples. It causes circular, '
        'sunken lesions on fruit with black, shriveled appearance, leading to '
        'fruit rot and loss.',
    'Cedar Apple Rust': 'Cedar apple rust is a fungal disease that affects '
        'both apples and cedar trees. It is caused by Gymnosporangium juniperi-virginianae '
        'and appears as orange, gelatinous spore horns on leaves and fruit. It can '
        'cause defoliation and affect fruit quality.',
    'Healthy': 'The plant appears to be healthy with no signs of disease or '
        'pest damage. Healthy apple trees have vibrant, green leaves and '
        'well-formed fruit, indicating optimal growth conditions.',
  };
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  void dispose() async {
    await Tflite.close();
    super.dispose();
  }

  String getDescription(String label) {
    return labelDescriptions[label] ?? 'No description available';
  }

  Future<void> loadModel() async {
    try {
      await Tflite.loadModel(
        model: 'assets/model4.tflite',
        labels: 'assets/labels4.txt',
      );
    } catch (e) {
      print('Failed to load model: $e');
    }
  }

  Future<List<dynamic>?> predictImage(String imagePath) async {
    try {
      final List<dynamic>? recognitions = await Tflite.runModelOnImage(
        path: imagePath,
        numResults: 1,
        threshold: 0.1,
        imageMean: 127.5,
        imageStd: 127.5,
      );
      return recognitions ?? null;
    } catch (e) {
      print('Failed to predict image: $e');
      return null;
    }
  }

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        image = pickedFile;
        isPredictPressed = false;
      });
    }
  }

  Future<void> _predict() async {
    if (image != null) {
      setState(() {
        _recognitions = null; // Reset recognitions
        isPredictPressed = true;
      });
      List<dynamic>? results = await predictImage(image!.path);
      setState(() {
        _recognitions = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff0266),
      appBar: AppBar(
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
        centerTitle: true,
      ),
      drawer: const NavigationDrawer(),
      body: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          color: Colors.white.withOpacity(0.9),
        ),
        child: Column(
          children: [
            Text(
              'Upload Image for Recognition',
              textAlign: TextAlign.center,
              style: GoogleFonts.gabarito(
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Select an image of apple leaves or fruit',
              style: GoogleFonts.gabarito(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton.icon(
              onPressed: () => _getImage(ImageSource.gallery),
              label: const Text('Choose File'),
              icon: const Icon(Icons.image),
            ),
            ElevatedButton.icon(
              onPressed: () => _getImage(ImageSource.camera),
              label: const Text('Take Photo'),
              icon: const Icon(Icons.camera_alt_outlined),
            ),
            if (image != null)
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.file(
                        File(image!.path),
                        fit: BoxFit.contain,
                      ),
                    ),
                    if (image != null && !isPredictPressed)
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () => _predict(),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.green.shade700),
                          ),
                          child: Text(
                            'Predict',
                            style: GoogleFonts.gabarito(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    if (_recognitions != null &&
                        _recognitions!.isNotEmpty &&
                        isPredictPressed)
                      Column(
                        children: [
                          for (final recognition in _recognitions!)
                            Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    ' Result:',
                                    style: GoogleFonts.gabarito(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${recognition['label']} (${(recognition['confidence'] * 100).toStringAsFixed(2)}%)',
                                    style: GoogleFonts.gabarito(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    ' Description:',
                                    style: GoogleFonts.gabarito(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    getDescription(recognition['label']),
                                    style: GoogleFonts.gabarito(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    if ((_recognitions == null || _recognitions!.isEmpty) &&
                        isPredictPressed)
                      const Text(
                        'Image not matched',
                        style: TextStyle(fontSize: 18),
                      ),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          image = null;
                          _recognitions = null;
                          isPredictPressed = false;
                        });
                      },
                      label: const Text('Remove Image'),
                      icon: const Icon(Icons.close),
                    )
                  ],
                ),
              )
            else
              const SizedBox(),
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
              color: Color.fromARGB(255, 226, 100, 123),
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
            title: const Text('Search'),
            onTap: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
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

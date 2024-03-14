import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  XFile? image;
  List<dynamic>? _recognitions;

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
        _recognitions = null; // Reset recognitions
      });
      List<dynamic>? results = await predictImage(pickedFile.path);
      setState(() {
        _recognitions = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apple Plant Disease Detector'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: () => _getImage(ImageSource.gallery),
                label: Text('Choose Image'),
                icon: Icon(Icons.image),
              ),
              ElevatedButton.icon(
                onPressed: () => _getImage(ImageSource.camera),
                label: Text('Take Photo'),
                icon: Icon(Icons.camera_alt_outlined),
              ),
            ],
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
                  if (_recognitions != null && _recognitions!.isNotEmpty)
                    Column(
                      children: [
                        for (final recognition in _recognitions!)
                          Column(
                            children: [
                              ListTile(
                                title: Text(
                                  ' Result:',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  '${recognition['label']} (${(recognition['confidence'] * 100).toStringAsFixed(2)}%)',
                                  style: TextStyle(fontSize: 12),
                                ),
                               ),
                              
                               ListTile(
                                title: Text(
                                  ' Description:',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  getDescription(recognition['label']),
                                  style: TextStyle(fontSize: 12),
                                ),
                               ),
                            ],
                          ),
                      ],
                    ),
                  if (_recognitions == null || _recognitions!.isEmpty)
                    Text(
                      'Image not matched',
                      style: TextStyle(fontSize: 18),
                    ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        image = null;
                        _recognitions = null;
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
    );
  }
}
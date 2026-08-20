import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_web/image_picker_web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StegOnline',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    SteganographyScreen(),
    AboutPage(),
    DetailsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _navButton(String title, int index) {
    bool selected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? Colors.white : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 18,
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.white24),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.lock, color: Colors.white),
                const SizedBox(width: 12),
                const Text(
                  "StegOnline",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const Spacer(),
                _navButton("Home", 0),
                const SizedBox(width: 20),
                _navButton("About", 1),
                const SizedBox(width: 20),
                _navButton("Details", 2),
              ],
            ),
          ),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }
}

class SteganographyScreen extends StatefulWidget {
  const SteganographyScreen({super.key});

  @override
  State<SteganographyScreen> createState() => _SteganographyScreenState();
}

class _SteganographyScreenState extends State<SteganographyScreen> {
  Uint8List? selectedImage;
  String message = "";
  bool isEncoding = false;
  bool isDecoding = false;

  final String baseUrl = "http://127.0.0.1:5000";

  Future<void> pickImage() async {
    final image = await ImagePickerWeb.getImageAsBytes();
    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  Future<void> encodeImage() async {
    if (selectedImage == null || message.isEmpty) return;

    setState(() => isEncoding = true);

    try {
      final response = await http
          .post(
            Uri.parse("$baseUrl/encode"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "image": base64Encode(selectedImage!),
              "message": message,
            }),
          )
          .timeout(const Duration(seconds: 60));

      if (response.statusCode == 200) {
        final blob = html.Blob([response.bodyBytes], 'image/png');
        final url = html.Url.createObjectUrlFromBlob(blob);

        html.AnchorElement(href: url)
          ..setAttribute("download", "stego_image.png")
          ..click();

        html.Url.revokeObjectUrl(url);

        _showSnack("Image downloaded successfully!");
      } else {
        _showSnack("Error: ${response.body}");
      }
    } catch (e) {
      _showSnack("Error: $e");
    }

    setState(() => isEncoding = false);
  }

  Future<void> decodeImage() async {
    if (selectedImage == null) return;

    setState(() => isDecoding = true);

    try {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse("$baseUrl/decode"),
      );

      request.files.add(
        http.MultipartFile.fromBytes(
          'image',
          selectedImage!,
          filename: "stego_image.png",
        ),
      );

      var response = await request.send();

      if (response.statusCode == 200) {
        final decodedData = await response.stream.bytesToString();
        final decodedMap = jsonDecode(decodedData);
        _showDialog(decodedMap['message'] ?? "No message found");
      } else {
        _showSnack("Decode failed");
      }
    } catch (e) {
      _showSnack("Error: $e");
    }

    setState(() => isDecoding = false);
  }

  void _showDialog(String msg) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Colors.white),
        ),
        title: const Text(
          "Decoded Message",
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          msg,
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          )
        ],
      ),
    );
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: 1000,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              const Text(
                "Steganography Tool",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 46,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Hide secret messages inside images using AI powered steganography",
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: pickImage,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: selectedImage == null
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.cloud_upload,
                                color: Colors.white, size: 80),
                            SizedBox(height: 20),
                            Text(
                              "Upload Image",
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.memory(
                            selectedImage!,
                            fit: BoxFit.contain,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter Secret Message",
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onChanged: (value) => message = value,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: isEncoding ? null : encodeImage,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 22,
                      ),
                    ),
                    child: Text(
                      isEncoding ? "Encoding..." : "Encode",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  OutlinedButton(
                    onPressed: isDecoding ? null : decodeImage,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 22,
                      ),
                    ),
                    child: Text(
                      isDecoding ? "Decoding..." : "Decode",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white24),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  "Your data is secure. Images are processed locally and not stored.",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Steganography using Deep Learning",
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Use PNG images only for best results.",
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
        ),
      ),
    );
  }
}
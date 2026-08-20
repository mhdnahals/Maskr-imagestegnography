import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';

class ApiService {
  final String baseUrl = "http://127.0.0.1:5000"; // Your Flask server URL

  // Method to send image & message for encoding
  Future<String> encodeImage(Uint8List imageBytes, String message) async {
    String base64Image = base64Encode(imageBytes);

    var response = await http.post(
      Uri.parse('$baseUrl/encode'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"image": base64Image, "message": message}),
    );

    if (response.statusCode == 200) {
      return "Image encoded successfully!";
    } else {
      return "Failed to encode image.";
    }
  }

  // Method to send image for decoding
  Future<String> decodeImage(Uint8List imageBytes) async {
    String base64Image = base64Encode(imageBytes);

    var response = await http.post(
      Uri.parse('$baseUrl/decode'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"image": base64Image}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['decoded_message'];
    } else {
      return "Failed to decode image.";
    }
  }
}
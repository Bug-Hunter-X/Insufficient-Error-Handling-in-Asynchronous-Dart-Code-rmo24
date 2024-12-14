```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiError extends Error {
  final String message;
  ApiError(this.message);
  @override
  String toString() => "API Error: $message";
}

class JsonDecodeError extends Error {
  final String message;
  JsonDecodeError(this.message);
  @override
  String toString() => "JSON Decode Error: $message";
}

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        return jsonDecode(response.body);
      } catch (e) {
        throw JsonDecodeError('Failed to decode JSON: $e');
      }
    } else {
      throw ApiError('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Log the error for debugging
    print('Error fetching data: $e');
    // Re-throw the exception so it can be handled higher up in the call stack 
    rethrow; 
  }
}
```
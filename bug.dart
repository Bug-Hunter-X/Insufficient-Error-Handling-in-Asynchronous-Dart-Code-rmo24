```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Properly handle the response
      final jsonData = jsonDecode(response.body);
       // Process jsonData here
    } else {
      // Handle non-200 status codes
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions (network errors, etc.)
    print('Error fetching data: $e');
    // Optionally, rethrow the exception to be handled higher up
    rethrow; 
  }
}
```
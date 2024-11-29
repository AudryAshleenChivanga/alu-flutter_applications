import 'dart:convert';
import 'package:http/http.dart' as http;

var link = "https://opentdb.com/api.php?amount=20&category=9";

Future<Map<String, dynamic>?> getQuiz() async {
  try {
    var res = await http.get(Uri.parse(link));
    
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body.toString());
      print("Data is loaded successfully.");
      return data; // Return the data if the request is successful
    } else {
      // Handle non-200 status code (server errors, etc.)
      print('Failed to load quiz data. Status code: ${res.statusCode}');
      return null;
    }
  } catch (e) {
    // Handle any exceptions like network issues
    print('Error fetching quiz data: $e');
    return null;
  }
}

// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://team-git-gud.dokku.cse.lehigh.edu/messages';

  // GET all messages
  Future<List<Map<String, dynamic>>> getMessages() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      print('Response body: ${response.body}');

      
      // Extract mData and map it to the expected structure
      List<dynamic> data = decoded['mData'];
      return data.map((item) {
        return {
          'id': item['mId'],          // Use 'mId' for message ID
          'message': item['mTitle'],  // Use 'mTitle' for message content
          'likes': 0,                 // Default likes, if not provided
          'isLiked': false,           // Default isLiked status
        };
      }).toList();
    } else {
      throw Exception('Failed to load messages');
    }
  }



  // POST a new message
  Future<void> createMessage(String message) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"likes": 0, "message": message}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to create message');
    }
  }

  // PUT request to update likes of a message
  Future<void> updateLikes(int id, int likes) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"likes": likes}), // Include likes only
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update likes');
    }
  }

  // DELETE a message by ID
  Future<void> deleteMessage(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete message');
    }
  }
}

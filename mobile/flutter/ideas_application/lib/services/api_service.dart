import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://team-git-gud.dokku.cse.lehigh.edu';

  // Get the list of messages
  Future<List<dynamic>> fetchMessages() async {
    final response = await http.get(Uri.parse('$baseUrl/messages'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load messages');
    }
  }

  // Add a new message
  Future<void> addMessage(String message) async {
    final response = await http.post(
      Uri.parse('$baseUrl/messages'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': message, 'likes': 0}),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add message');
    }
  }

  // Update likes for a message
  Future<void> updateLikes(int id, int likes) async {
    final response = await http.put(
      Uri.parse('$baseUrl/messages/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'likes': likes}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update message');
    }
  }

  // Delete a message
  Future<void> deleteMessage(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/messages/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete message');
    }
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:frontend/Models/user.dart';

class Auth {
  final String baseUrl = "http://localhost:5001/api/auth";

  Future<String?> signup(User user) async{

    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-type' : 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      return data['token'];
    }
    else {
      return null;
    }
  }

}
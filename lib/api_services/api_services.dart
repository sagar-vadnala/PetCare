// import 'dart:convert';
// import 'package:dog_assignment/model/model.dart';
// import 'package:http/http.dart' as http;

// class ApiService {

//   static Future<Dog?> getImage() async {
    
//     var response = await http.get(Uri.parse("https://dog.ceo/api/breeds/image/random"));

//     if (response.statusCode == 200) {
//       Dog dog = Dog.fromJson(jsonDecode(response.body));
//       return dog;
//     }
//     return null;
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<String?> fetchRandomDogImage() async {
    final url = Uri.parse('https://dog.ceo/api/breeds/image/random');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['message'];
      } else {
        print('Failed to load dog image: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred while fetching dog image: $e');
      return null;
    }
  }
}


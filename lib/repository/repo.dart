// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

// class ApiService {
//   final String apiUrl = ApiUrl.getContactList;
//
//   Future<List<dynamic>> fetchData() async {
//     final response = await http.get(Uri.parse(apiUrl));
//
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body)['data'];
//     } else {
//       throw Exception('Failed to load data');
//     }
//
//   }
// }

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter_assignment/utilities/urls.dart';

import '../model/user_model.dart';

final userProvider = FutureProvider<List<UserModel>>((ref) async {

  String userUrl = ApiUrl.getContactList;

  final response = await http.get(Uri.parse(userUrl));



  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body)['data'];

    return data.map((json) => UserModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
});

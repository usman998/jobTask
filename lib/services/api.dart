import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Api{

  static Future<dynamic> getUsers() async {
    final response = await http.get(
        Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body).toString());
      var data = jsonDecode(response.body);
      return data;
    } else {
      print(jsonDecode(response.body).toString());
      return null;
    }
  }
}
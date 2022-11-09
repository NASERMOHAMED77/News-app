import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class PostTest extends StatelessWidget {
  const PostTest({super.key});
  login() async {
    try {
      http.Response response = await http.post(
          Uri.parse('https://student.valuxapps.com/api/update-profile'),
          body: {"email": "ziadAna@ziad.com", "password": "1233456"});
      if (response.statusCode == 200) {
        print(json.decode(response.body));
      } else {
        print(json.decode(response.body));
      }
    } catch (e) {
      print(e);
    }
  }

  update() async {
    try {
      http.Response response = await http.put(
          Uri.parse('https://student.valuxapps.com/api/update-profile'),
          body: {"email": "ziadAna@ziad.com", "password": "1233456"},
          headers: {});
      if (response.statusCode == 200) {
        print(json.decode(response.body));
      } else {
        print(json.decode(response.body));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              login();
            },
            child: Text("test"),
          )
        ],
      ),
    );
  }
}

class Auth extends ChangeNotifier {}

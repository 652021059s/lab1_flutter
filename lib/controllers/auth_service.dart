import 'package:lab1_flutter/models/user_models.dart';
import 'package:lab1_flutter/screens/varibies.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class  AuthService{
 Future <void>login(String username, String password ) async{
    print(apiURL);

final response = await http.post(Uri.parse("$apiURL/api/user/login"),
headers:{"Content-Type":"application/json"},
body: jsonEncode(
  {
  "username":username,
  "password":password,
}
));
print(response.statusCode);
  }
}


import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/model/user.dart';

class StoreApiClient {
  static const baseUrl = "https://spc14.000webhostapp.com/api";
  final http.Client httpClient;

  const StoreApiClient({@required this.httpClient})
      : assert(httpClient != null);

  Future<User> login(String email, String password) async {

    final msg = jsonEncode({"email":email,"password":password});
      final response = await http.post(
          "$baseUrl/login",
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: msg
      );
      return User.convertJson(jsonDecode(response.body));
  }
}

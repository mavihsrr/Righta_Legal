import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHelper {
  static const String queryBaseUrl =
      "https://a5c3-2405-201-3004-3231-7d8f-e6e4-a8be-cb48.ngrok-free.app/query";
  static const String callBaseUrl = "https://api.bland.ai/v1/calls";
  static const String apiKey =
      "sk-zkic20236xlh90oguo8fek0aclmpnrv0t8youl8yc8lt0lkvnniffsmzlyd8yhul69";

  static Future<String> sendQuery(String query) async {
    final response = await http.post(
      Uri.parse(queryBaseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"query": query}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data['result'] ?? "No result found";
    } else {
      throw Exception(
          'Failed to load data with status code: ${response.statusCode}');
    }
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final payload = {
      "phone_number": phoneNumber,
      "task":
          "The main objective of this phone call is to gather information about the caller's query who is in legal trouble and seeks advice. The goal is to assist the caller's query and give him helpful legal advice",
      "first_sentence":
          "Hello, I'm calling from righta, your legal assistant. Could you please tell me about your query?",
      "wait_for_greeting": true,
      "model": "enhanced",
      "tools": [],
      "voice": "Alexa",
      "record": true,
      "voice_settings": {},
      "language": "eng",
      "answered_by_enabled": true,
      "temperature": 0,
      "amd": false,
    };
    final headers = {
      "authorization":
          "sk-zkic20236xlh90oguo8fek0aclmpnrv0t8youl8yc8lt0lkvnniffsmzlyd8yhul69",
      "Content-Type": "application/json",
    };

    try {
      final response = await http.post(
        Uri.parse(callBaseUrl),
        headers: headers,
        body: json.encode(payload),
      );

      final responseJson = json.decode(response.body);
      if (response.statusCode == 200) {
        print('Call initiated: ${responseJson['message']}');
      } else {
        print(
            'Failed to make call with status code: ${response.statusCode} and message: ${responseJson['message']}');
      }
    } catch (e) {
      print('Error making call: $e');
    }
  }
}

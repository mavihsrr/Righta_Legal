import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CallApiPage extends StatefulWidget {
  @override
  _CallApiPageState createState() => _CallApiPageState();
}

class _CallApiPageState extends State<CallApiPage> {
  Future<void> makePhoneCall() async {
    const url = "https://api.bland.ai/v1/calls";
    const apiKey = "your_api_key_here"; // Replace with your API key
    final payload = {
      "phone_number": "+916267702526",
      // ... include other fields as required
    };
    final headers = {
      "authorization": apiKey,
      "Content-Type": "application/json",
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(payload),
      );

      final responseJson = json.decode(response.body);
      if (response.statusCode == 200) {
        print('Call initiated: ${responseJson['message']}');
      } else {
        print('Failed to make call: ${responseJson['message']}');
      }
    } catch (e) {
      print('Error making call: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Call Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: makePhoneCall,
          child: Text('Make a Call'),
        ),
      ),
    );
  }
}
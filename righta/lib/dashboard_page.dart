import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_helper.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final TextEditingController _phoneController = TextEditingController();
  void _handleCallButtonPressed() {
    String phoneNumber = _phoneController.text;
    // You should add validation of the phone number here before making the call
    ApiHelper.makePhoneCall(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 150,
        title: const Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Good Morning',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    'Shivam !',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff235543)),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffAED7C5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Get connected to Righta via call",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff235543))),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 50,
                              child: TextField(
                                controller: _phoneController,
                                decoration: InputDecoration(
                                  labelText: 'Write Phone No. to call',
                                  labelStyle: TextStyle(
                                      color: Color(0xff235543), fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        BorderSide(color: Color(0xff235543)),
                                  ),
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          IconButton(
                            icon: Icon(Icons.phone_forwarded),
                            color: Color(0xff235543),
                            onPressed: _handleCallButtonPressed,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("By Category",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff235543))),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          OutlinedButton(
                            child: Text('Criminal',
                                style: TextStyle(color: Color(0xff235543))),
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  width: 1.0,
                                  color: Color(
                                      0xff235543)), // Border width and color
                            ),
                          ),
                          SizedBox(width: 10),
                          OutlinedButton(
                            child: Text('Medical',
                                style: TextStyle(color: Color(0xff235543))),
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  width: 1.0,
                                  color: Color(
                                      0xff235543)), // Border width and color
                            ),
                          ),
                          SizedBox(width: 10),
                          OutlinedButton(
                            child: Text('Property',
                                style: TextStyle(color: Color(0xff235543))),
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  width: 1.0,
                                  color: Color(
                                      0xff235543)), // Border width and color
                            ),
                          ),
                          SizedBox(width: 10),
                          OutlinedButton(
                            child: Text('Tax',
                                style: TextStyle(color: Color(0xff235543))),
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  width: 1.0,
                                  color: Color(
                                      0xff235543)), // Border width and color
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Suggested Lawyers",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff235543))),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Image.asset("assets/images/l1.png", height: 200),
                      SizedBox(width: 20),
                      Image.asset("assets/images/l2.png", height: 200),
                      SizedBox(width: 20),
                      Image.asset("assets/images/l3.png", height: 200),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Your recent activity",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff235543))),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff235543),
                            ),
                          ]),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Call with Righta regarding car accident...",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff235543))),
                                Text("Yesterday, 10:00 PM",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff235543))),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.phone_forwarded,
                            color: Color(0xff235543),
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

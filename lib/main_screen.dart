import 'package:flutter/material.dart';

class CredentialsScreen extends StatelessWidget {
  final String userEmail;
  final String userName;
  final String userPhone;
  final String userAddress;

  CredentialsScreen(
      {required this.userEmail,
      required this.userName,
      required this.userAddress,
      required this.userPhone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Main Screen",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            buildInfoItem("Name", userName),
            buildInfoItem("Email", userEmail),
            buildInfoItem("Address", userAddress),
            buildInfoItem("Phone", userPhone),
          ],
        ),
      ),
    );
  }

  Widget buildInfoItem(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            child: Text(
              '$label:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

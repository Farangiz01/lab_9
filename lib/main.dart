import 'package:flutter/material.dart';
import 'package:lab_9/main_screen.dart';
import 'registration_screen.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Registration Screen'),
      ),
      body: const RegistrationScreen(),
    ),
  ));
}
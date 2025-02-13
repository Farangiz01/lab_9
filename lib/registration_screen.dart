import 'package:flutter/material.dart';
import 'package:lab_9/main_screen.dart';
import 'db_helper.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  List json_list = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Center(
              child: Icon(
                Icons.person, // Change this to your preferred icon
                size: 100, // Change this to your preferred size
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8), // Padding of 8
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded borders
                  ),
                  labelText: 'Username'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8), // Padding of 8
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded borders
                  ),
                  labelText: 'Password'),
              obscureText: true,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8), // Padding of 8
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded borders
                  ),
                  labelText: 'Phone'),
               validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8), // Padding of 8
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded borders
                  ),
                  labelText: 'Email'),
             validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8), // Padding of 8
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded borders
                  ),
                  labelText: 'Address'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                 
                    User user = User(
                      null,
                      _usernameController.text,
                      _passwordController.text,
                      _phoneController.text,
                      _emailController.text,
                      _addressController.text,
                    );

                  
                    DBHelper dbHelper = DBHelper();
                    await dbHelper.saveUser(user);

                    
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('User data saved')));
                    json_list = await dbHelper.test_read('user.db');
                    User user1 = User.fromJson(json_list[0]);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CredentialsScreen(
                                userEmail: user1.username,
                                userAddress: user1.address,
                                userPhone: user1.phone,
                                userName: user1.password)));
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
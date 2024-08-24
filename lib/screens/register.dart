import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _obscureText = true;

  // ตัวแปรเก็บค่าที่เลือกจาก ChoiceChip
  String _selectedRole = '';

  final List<String> _roles = ['User', 'Admin']; // รายการตัวเลือก

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person), // ไอคอนสำหรับ Username
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock), // ไอคอนสำหรับ Password
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              obscureText: _obscureText,
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person_outline), // ไอคอนสำหรับ Name
              ),
            ),
            SizedBox(height: 20),
            // แสดง ChoiceChips
            Wrap(
              spacing: 10.0,
              children: _roles.map((role) {
                return ChoiceChip(
                  label: Text(role),
                  selected: _selectedRole == role,
                  onSelected: (bool selected) {
                    setState(() {
                      _selectedRole = selected ? role : '';
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle register logic here
              },
              child: Text('Register'),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Already have an account? Login',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

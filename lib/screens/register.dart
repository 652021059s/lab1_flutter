import 'package:flutter/material.dart';
import 'package:lab1_flutter/controllers/auth_service.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>(); // ประกาศ _formKey
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _obscureText = true;

  // ตัวแปรเก็บค่าที่เลือกจาก ChoiceChip
  String _selectedRole = '';

  final List<String> _roles = ['User', 'Admin']; // รายการตัวเลือก

  void _register() async {
    if (_formKey.currentState!.validate()) {
      print('Username: ${_usernameController.text}');
      print('Password: ${_passwordController.text}');
      print('Name: ${_nameController.text}');
      print('Role: $_selectedRole');

      try {
        // สมมติว่า `auth().login` เป็นฟังก์ชันที่มีอยู่และใช้ได้
        final user = await AuthService().Register(
          _usernameController.text,
          _passwordController.text,
          _nameController.text,
          _selectedRole,
        );
 
        // เพิ่มการจัดการหลังจากการลงทะเบียนสำเร็จที่นี่ (เช่น เปลี่ยนหน้า)
      } catch (e) {
        
      }
    }
  }

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
        child: Form( // ใช้ Form widget และกำหนด key
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person), // ไอคอนสำหรับ Username
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              TextFormField(
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person_outline), // ไอคอนสำหรับ Name
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
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
                onPressed: _register, // เรียกใช้งานฟังก์ชันลงทะเบียน
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
      ),
    );
  }
}

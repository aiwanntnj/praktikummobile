import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/pages/page_home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login SharedPreference'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _login,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> _login() async {
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      if (_emailController.text == 'admin@domain.com' &&
          _passwordController.text == '12345') {
        setState(() {
          _isLoading = true;
        });

        // SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isUser', true);

        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        });
      } else {
        // Handle invalid login
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid email or password')),
        );
      }
    } else {
      // Handle empty fields
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both email and password')),
      );
    }

    // Stop loading indicator even if login fails
    setState(() {
      _isLoading = false;
    });
  }
}

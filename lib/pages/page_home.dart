import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/main.dart';
import 'package:myapp/pages/theme_setting.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDarkMode = false;
  bool _isUser = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isUser = prefs.getBool('isUser') ?? false;
      _isDarkMode = ThemeSettings.darkMode;
    });
  }

  void _onChangeSwitch(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = value;
    });
    prefs.setBool('darkMode', _isDarkMode);
    ReloadApp.of(context).rebuild();
  }

  void _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isUser');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _logOut,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selamat Datang'),
            SizedBox(height: 10.0),
            Text('Pilih Tema'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Light'),
                Switch(
                  value: _isDarkMode,
                  onChanged: _onChangeSwitch,
                ),
                Text('Dark'),
              ],
            ),
            SizedBox(height: 20.0),
            Text('Status Login: $_isUser'),
          ],
        ),
      ),
    );
  }
}

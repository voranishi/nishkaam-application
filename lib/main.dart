import 'package:app_project/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  Color backgroundColor = Colors.white; // Default background color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.account_circle,
                  size: 50.0,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 200.0,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  filled: true,
                  fillColor: Colors.white, // White background color
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              width: 200.0,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  filled: true,
                  fillColor: Colors.white, // White background color
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Check if username and password are 'admin'
                if (username == 'admin' && password == 'admin') {
                  // Navigate to another page when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                }
                // Change background color to white
                setState(() {
                  backgroundColor = Colors.white;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      body: Center(
        child: Text('This is another page'),
      ),
    );
  }
}

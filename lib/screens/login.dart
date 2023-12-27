import 'package:flutter/material.dart';
import 'home.dart';
import 'otpscreen.dart'; // Import the OTP verification screen

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Phone Number Text Field
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 16.0),
            // Login Button for OTP verification
            ElevatedButton(
              onPressed: () {
                // Navigate to OTP verification screen after successful login
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OTPScreen()),
                );
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('login via'),
                
                SizedBox(width: 10),
                DropdownButton<String>(
                  items: [
                    DropdownMenuItem(
                      child: Text('Gmail'),
                      value: 'gmail',
                    ),
                    DropdownMenuItem(
                      child: Text('Facebook'),
                      value: 'facebook',
                    ),
                  ],
                  onChanged: (value) {
                    if (value == 'gmail') {
                      // TODO: Implement login via Gmail
                      // loginWithGmail();
                    } else if (value == 'facebook') {
                      // TODO: Implement login via Facebook
                      // loginWithFacebook();
                    }
                  },
                  hint: Text('Select'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

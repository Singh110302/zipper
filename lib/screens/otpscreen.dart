import 'dart:async';
import 'package:flutter/material.dart';
import 'home.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  int _otp = 0; // Variable to store entered OTP
  int _remainingTime = 30; // Timer duration for OTP resend
  late Timer _timer; // Timer for resend functionality
  bool _timerRunning = false; // Flag to check if the timer is running

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer.cancel();
        _timerRunning = false;
      }
    });
  }

  void _submitOTP() {
    // Replace this with your OTP validation logic
    if (_otp.toString().length == 4) {
      // If OTP is valid, navigate to the home screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // If OTP is invalid, show an error or take appropriate action
      // For now, let's print an error message
      print('Invalid OTP');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter the 4-digit OTP sent to your phone number',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            // OTP input field
            SizedBox(
              width: 200.0,
              child: TextFormField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 4,
                onChanged: (value) {
                  setState(() {
                    _otp = int.tryParse(value) ?? 0;
                  });
                },
                decoration: InputDecoration(
                  counterText: '', // Hide the default character counter
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Resend OTP and Timer
            _timerRunning
                ? Text('Resend OTP in $_remainingTime seconds')
                : ElevatedButton(
              onPressed: () {
                // Add logic to resend OTP
                setState(() {
                  _remainingTime = 30;
                  _timerRunning = true;
                });
                startTimer();
                // Add functionality to resend OTP
              },
              child: Text('Resend OTP'),
            ),
            SizedBox(height: 20.0),
            // Submit button
            ElevatedButton(
              onPressed: _submitOTP,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

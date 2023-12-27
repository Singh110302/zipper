import 'package:flutter/material.dart';
class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Personal Information Section
            ProfileSection(
              title: 'Personal Information',
              items: [
                ProfileItem( value: 'John Doe'),
                ProfileItem( value: '+123 456 7890'),
                ProfileItem( value: 'john.doe@example.com'),
              ],
            ),
            SizedBox(height: 16.0),

            // Previous Ride Information Section
            ProfileSection(
              title: 'Previous Ride Information',
              items: [
                ProfileItem( value: '2023-01-01'),
                ProfileItem( value: 'A to B'),
                ProfileItem( value: '20.00'),
              ],
            ),
            SizedBox(height: 16.0),

            // About Us
            ProfileSection(
              title: 'About Us',
              items: [
                ProfileItem(value: 'We are dedicated to providing '),
               ProfileItem (value: 'seamless and efficient cab sharing experience.'
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Contact Us Section
            ProfileSection(
              title: 'Contact Us',
              items: [
                ProfileItem(
                  value:
                  'For any inquiries or assistance',
                ),
                ProfileItem(
                  value:
                  ' please contact us at support@example.com',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final String title;
  final List<ProfileItem> items;

  ProfileSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items,
        ),
      ],
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String value;

  ProfileItem({required this.value});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

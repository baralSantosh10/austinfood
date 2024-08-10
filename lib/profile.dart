import 'package:austinfood/edit_profile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.deepOrange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/images/profile.png',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'john.doe@example.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfilePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildProfileDetailItem('Full Name', 'John Doe'),
                  _buildProfileDetailItem('Email', 'john.doe@example.com'),
                  _buildProfileDetailItem('Phone', '+1 123 456 7890'),
                  _buildProfileDetailItem(
                      'Address', '123 Main Street, Anytown, USA'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileDetailItem(String title, String detail) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
        subtitle: Text(detail),
        leading: const SizedBox(
          width: 24,
          child: Icon(Icons.info_outline, color: Colors.deepOrange),
        ),
      ),
    );
  }
}

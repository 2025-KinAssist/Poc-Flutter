import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Mon profil'),
        backgroundColor: Color(0xFF5B5FFE),
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xFF5B5FFE),
            height: MediaQuery.of(context).size.height * 0.25,
            child: Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://media.licdn.com/dms/image/D4E03AQECWzZMA9p-Hg/profile-displayphoto-shrink_800_800/0/1668182694207?e=1691625600&v=beta&t=X5CaVJ9U6OdRRE2761yTY_K4Sa_FxIwE_xU_rw5B1qY'), // Random image
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildProfileInfoField(title: 'Nom', subtitle: 'John Doe'),
                    _buildProfileInfoField(title: 'Prénom', subtitle: 'Doe'),
                    _buildProfileInfoField(title: 'Date de naissance', subtitle: '01-01-1980'),
                    _buildProfileInfoField(title: 'Email', subtitle: 'john.doe@gmail.com'),
                    _buildProfileInfoField(title: 'Numéro de carte vitale', subtitle: '123456789'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfoField({required String title, required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          TextField(
            controller: TextEditingController(text: subtitle),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.grey, width: 2.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.grey, width: 2.0),
              ),
            ),
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
            enabled: false,
          ),
        ],
      ),
    );
  }
}

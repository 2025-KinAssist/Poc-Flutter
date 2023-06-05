import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'physio_page.dart';

void main() {
  runApp(MyApp());
}

class ConnectedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.white,
        elevation: 0,

      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit : BoxFit.cover,  
            
            
                      
          ),
        ),
        padding: EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hey John Doe!',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Text(
              'Il vous reste 10 minutes d\'exercices aujourd\'hui',
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 40 ),            
            _buildButton(
              
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              label: 'Profil',
              imageUrl: 'https://i.pinimg.com/originals/b1/2d/5e/b12d5ee0ecb86c454a4c222b896e3855.gif',
            ),
            SizedBox(height: 20),
            _buildButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhysioPage()),
                );
              },
              label: 'Kiné',
              imageUrl: 'https://i.pinimg.com/originals/38/9f/8a/389f8a59fe2ae105562ae548798dee47.gif',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({required VoidCallback onPressed, required String label, required String imageUrl}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF0500FF), width: 2),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 1,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            //increase width of button
            child: Text(label, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
            style: TextButton.styleFrom(
              //increase width of button
              minimumSize: Size(double.infinity, 100),
              primary: Colors.white,
              padding: EdgeInsets.all(56.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test de poc pour kinassist'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.white],
            ),
          ),
          child: Center(
            child: Builder(
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 48),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Identifiant',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 24),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ConnectedPage()),
                          );
                        },
                        child: Text('Se connecter'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

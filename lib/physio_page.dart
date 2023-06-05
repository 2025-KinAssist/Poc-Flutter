import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhysioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Mon Kiné'),
        backgroundColor: Color(0xFF5B5FFE),
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xFF5B5FFE),
            height: MediaQuery.of(context).size.height * 0.25,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://pbs.twimg.com/media/E5M4wHSUcAAab62.jpg'), // Random image
                  ),
                  SizedBox(height: 10),
                  Text('John Doe', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.phone, color: Colors.white),
                        onPressed: () async {
                          // launch phone dialer with number
                          String url = "tel:+123456789";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.message, color: Colors.white),
                        onPressed: () async {
                          // launch SMS
                          String url = "sms:+123456789";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildOpeningHours(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOpeningHours() {
    return Container(
      padding: const EdgeInsets.all(36.4),
      //increase width of container 
        width: 300,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: List.generate(5, (index) {
          final dayOfWeek = ['      Lundi', '       Mardi', '    Mercredi', '      Jeudi', '   Vendredi'][index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 9.0),
            child: Text('$dayOfWeek: \n\n 8:00 - 18:00', style: TextStyle(fontSize: 18)),
          );
        }),
      ),
    );
  }
}


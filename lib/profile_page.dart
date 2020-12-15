import 'package:fewaclothing/providers/user_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.pink),
        title: Text(
          'Fewa Clothing',
          style: GoogleFonts.greatVibes(
            textStyle: TextStyle(
                color: Colors.pink, fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 40, 25, 0),
        child: Column(
          children: [
            Center(
              child: ListTile(
                  title: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/pp.jpg'),
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  Text(
                    '@rokrij',
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                          color: Colors.pink,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      'srokrij@gmail.com',
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                            color: Colors.pink,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.pink,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.pink,
                ),
                title: Text(
                  'My Account',
                  style: GoogleFonts.poiretOne(
                    textStyle: TextStyle(
                        color: Colors.pink,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'account', (route) => false);
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.notifications_active,
                  color: Colors.pink,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.pink,
                ),
                title: Text(
                  'Notifications',
                  style: GoogleFonts.poiretOne(
                    textStyle: TextStyle(
                        color: Colors.pink,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'notification', (route) => false);
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.description,
                  color: Colors.pink,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.pink,
                ),
                title: Text(
                  'About Us',
                  style: GoogleFonts.poiretOne(
                    textStyle: TextStyle(
                        color: Colors.pink,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'aboutUs', (route) => false);
              },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.pink,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.pink,
                ),
                title: Text(
                  'Log Out',
                  style: GoogleFonts.poiretOne(
                    textStyle: TextStyle(
                        color: Colors.pink,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  Provider.of<UserAuthProvider>(context, listen: false)
                      .saveEmail('');
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'login', (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

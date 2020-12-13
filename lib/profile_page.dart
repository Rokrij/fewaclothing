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
          style: GoogleFonts.greatVibes(textStyle: TextStyle(color: Colors.pink,fontSize: 35,fontWeight: FontWeight.bold),),
        ),),
      body:   ListView(
        children: [
          Text('This is Profile Page'),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
            child: FlatButton(
              color: Colors.pink,
              textColor: Colors.white,
              onPressed: () {
                Provider.of<UserAuthProvider>(context,listen:false).saveEmail('');
                Navigator.pushNamedAndRemoveUntil(
                    context, 'login', (route) => false);
              },
              child: Text(
                "LOG OUT",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

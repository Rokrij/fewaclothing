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
      body:   Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 30),
        child: Column(
          children: [
            Center(
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom:50),
                  child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/images/download.jpg')
                  ),
                )
              ),
            ),
            Card(child: ListTile(
              leading: Icon(Icons.person,color: Colors.pink,),
              title: Text('My Account',style: GoogleFonts.poiretOne(
                textStyle: TextStyle(color: Colors.pink, fontSize: 25,fontWeight: FontWeight.bold),
              ),),
            ),
            ), Card(child: ListTile(
              leading: Icon(Icons.notifications_active,color: Colors.pink,),
              title: Text('Notifications',style: GoogleFonts.poiretOne(
                textStyle: TextStyle(color: Colors.pink, fontSize: 25,fontWeight: FontWeight.bold),
              ),),
            ),
            ), Card(child: ListTile(
              leading: Icon(Icons.description,color: Colors.pink,),
              title: Text('About Us',style: GoogleFonts.poiretOne(
                textStyle: TextStyle(color: Colors.pink, fontSize: 25,fontWeight: FontWeight.bold),
              ),),
            ),
            ), Card(child: ListTile(
              leading: Icon(Icons.exit_to_app,color: Colors.pink,),
              title: Text('Log Out',style: GoogleFonts.poiretOne(
                textStyle: TextStyle(color: Colors.pink, fontSize: 25,fontWeight: FontWeight.bold),
              ),), onTap: () {
              Provider.of<UserAuthProvider>(context,listen:false).saveEmail('');
              Navigator.pushNamedAndRemoveUntil(
                  context, 'login', (route) => false);
            },
            ) ,
            ),
          ],
        ),
      ),
    );
  }
}

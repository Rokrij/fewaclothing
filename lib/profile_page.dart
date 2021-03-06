import 'package:avatar_glow/avatar_glow.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:fewaclothing/providers/user_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

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
        child: ListView(
          children: [
            Center(
              child: ListTile(
                title: AvatarGlow(
                  endRadius: 90.0,
                  child: Material(
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircularProfileAvatar(
                      "",
                      errorWidget: (context, url, error) => Container(
                        child: Icon(Icons.error),
                      ),
                      placeHolder: (context, url) => Container(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(),
                      ),
                      radius: 50,
                      backgroundColor: Colors.transparent,
                      borderWidth: 10,
                 initialsText: Text(
               Provider.of<UserAuthProvider>(context, listen: true).getEmailFirstLetter().toString() ?? '',
               style: TextStyle(fontSize: 40, color: Colors.white),
                 ),
                      borderColor: Colors.blueGrey,
                      elevation: 5.0,
                      cacheImage: true,
                      showInitialTextAbovePicture: false,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      Provider.of<UserAuthProvider>(context, listen: true).email,
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
                  size: 15,
                ),
                title: Text(
                  'My Account',
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        color: Colors.pink,
                        fontSize: 25,
                        ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'account');
                },
              ),
            ),
            SizedBox(
              height: 12,
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
                  size: 15,
                ),
                title: Text(
                  'Feedback',
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        color: Colors.pink,
                        fontSize: 25,
                       ),
                  ),
                ),
                onTap: () {
                  sendEmail("fewaclothingstore@gmail.com");
                  //Navigator.pushNamed(context, 'notification');
                },
              ),
            ),
            SizedBox(
              height: 12,
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
                  size: 15,
                ),
                title: Text(
                  'About Us',
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        color: Colors.pink,
                        fontSize: 25,
                        ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'aboutUs');
                },
              ),
            ),
            SizedBox(
              height: 12,
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
                  size: 15,
                ),
                title: Text(
                  'Log Out',
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        color: Colors.pink,
                        fontSize: 25,
                       ),
                  ),
                ),
                onTap: () {
                  AwesomeDialog(
                    btnCancelColor: Colors.yellow,
                    btnOkColor: Colors.pink,
                    btnCancelText: 'No',
                    btnOkText: 'Yes',
                    context: context,
                    dialogType: DialogType.INFO,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'Are you sure',
                    desc: 'You want to logout?',
                    body: Center(
                        child: Text(
                      'Are You Sure?',
                      style: GoogleFonts.poiretOne(
                        textStyle: TextStyle(
                            color: Colors.pink,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {
                      Provider.of<UserAuthProvider>(context, listen: false)
                          .saveEmail('');
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'login', (route) => false);
                    },
                  )..show();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void sendEmail(String email) => launch("mailto:$email");
}

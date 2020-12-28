import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Drawer fewaDrawer(BuildContext context) {
  return Drawer(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              'Fewa Clothing',
              style: TextStyle(fontSize: 20.0),
            ),
            decoration: BoxDecoration(color: Colors.white),
          ),
          ListTile(
            title: FlatButton(
              color: Colors.white,
              textColor: Colors.pink,
              onPressed: () {
                removeEmail();
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
    ),
  );
}

void removeEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', '');
}

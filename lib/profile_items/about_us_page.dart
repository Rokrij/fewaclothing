import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: (Icon(
            Icons.arrow_back_ios,
            color: Colors.pink,
            size: 30,
          )),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.pink),
      ),
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/images/3.png'),
              height: 150,
              //fit: BoxFit.fill
            ),
            Text('This is About Us'),
          ],
        ),
      ),

    );
  }
}

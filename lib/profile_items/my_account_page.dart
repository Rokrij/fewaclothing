import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Personal Information'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name'),
              IconButton(
                  icon: Icon(Icons.create),
                  onPressed: () {
                    Navigator.pushNamed(context, 'cart');
                  }),

            ],
          ),
          TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.person)),
          ),
          Text('Email'),
          TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.mail)),
          ),
        ],
      ),
    );
  }
}

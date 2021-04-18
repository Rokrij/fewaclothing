import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAccount extends StatelessWidget {
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left:20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Personal Information',
                      style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                  color: Colors.pink,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  ),),
                  IconButton(
                      icon: Icon(Icons.create,color: Colors.pink,),
                      onPressed: () {
                        Navigator.pushNamed(context, 'cart');
                      }),
                ],
              ),
              SizedBox(height: 40,),
              Text('Name',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 25,
                      ),
                ),),
              Padding(
                padding: const EdgeInsets.only(right:20),
                child: TextField(),
              ),
              Padding(
                padding: const EdgeInsets.only(top:30),
                child: Text('Email',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 25,
                        ),
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.only(right:20),
                child: TextField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

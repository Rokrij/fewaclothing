import 'package:fewaclothing/providers/user_auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
              SizedBox(height: 120,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Personal Information',
                      style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                  color: Colors.pink,
                      fontSize: 25,
                      ),
                  ),),
                  IconButton(
                      icon: Icon(Icons.create,color: Colors.pink,),
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: "Sorry Email Cannot be Edited !",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blueGrey,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }),
                ],
              ),
              SizedBox(height: 40,),
              Text('Name',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15,
                    fontWeight: FontWeight.bold
                      ),
                ),),
              Padding(
                padding: const EdgeInsets.only(right:20),
                child: TextField(style:GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),enabled: false,
                    decoration: InputDecoration(
                    hintText: 'Rokrij'
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:30),
                child: Text('Email',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                      fontWeight: FontWeight.bold
                        ),
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.only(right:20),
                child: TextField(style:GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                  ),
                ) , enabled: false, decoration: InputDecoration(
                    hintText: Provider.of<UserAuthProvider>(context, listen: true).email
                ),),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('2020-2021 \u00a9 ', style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20,
                        ),
                      ) ,),
                      Text('Fewa Clothing', style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                        ),
                      ) ,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

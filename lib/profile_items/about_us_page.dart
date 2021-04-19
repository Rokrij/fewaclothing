import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Column(
        children: [
          Image(
            image: AssetImage('assets/images/3.png'),
            height: 250,
            //fit: BoxFit.fill
          ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
          Container(
            child: Text(
                  'Using this application, people can shop in the morning using the app or in their free time and the product will be delivered within small amount of time which will save the customer time as well as money they would have spent on unnecessary products will be convenient to use for the people who have tight schedule and cannot go for shopping.',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                   ),
              ),
            ),
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

        ],),
        ),

        ],
      ),
    );
  }
}

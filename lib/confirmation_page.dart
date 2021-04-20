import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmationPage extends StatelessWidget {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 200,),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom:10,top: 10),
                child: Text('Order Status:',style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Colors.pink,
                    fontSize: 30,
                  ),
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10, bottom: 10),
              child: Text('Your order has been confirmed successfully.',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10, bottom: 10),
              child: Text('Thankyou for choosing us.',style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 22,
                ),
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10, bottom: 10),
              child: Text('#SHOPWITHFEWA',style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.pink,
                  fontSize: 22,
                ),
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10, bottom: 10),
              child: Image(
                image: AssetImage('assets/gif/1.gif'),
                height: 105,
              ),
            ),
            GestureDetector(
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: FlatButton(
                  child: Text('Continue Shopping',
                    style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),),
                ),
              ), onTap: (){
              Navigator.pushNamedAndRemoveUntil(
                  context, 'nav', (route) => false);

            },),
            SizedBox(height: 100,),
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
    );
  }
}

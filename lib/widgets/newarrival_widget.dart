import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewArrivalWidget extends StatefulWidget {
  @override
  _NewArrivalWidgetState createState() => _NewArrivalWidgetState();
}

class _NewArrivalWidgetState extends State<NewArrivalWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child:
            Image(
              image: AssetImage('assets/images/a.png'),
              height: 275,
              width: 250,
            ),
            borderRadius: BorderRadius.circular(40.0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,bottom: 10),
            child: Text('Name',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(color: Colors.pink, fontSize: 20,),)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,bottom: 10),
            child: Text('Price',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(color: Colors.pink, fontSize: 20),
                )),
          ),],
      ),
    );
  }
}

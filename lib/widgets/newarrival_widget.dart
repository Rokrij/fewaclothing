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
      child: Align(
        child: Column(
          children: [
            ClipRRect(
              child:
              Image(
                image: AssetImage('assets/images/b.jpg'),
                height: 275,
                width: 250,
              ),
              borderRadius: BorderRadius.circular(40.0),
            ),
            Text('Name',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(color: Colors.pink, fontSize: 20,),)),
            Text('Price',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(color: Colors.pink, fontSize: 20),
                )),],
        ),
      ),
    );
  }
}

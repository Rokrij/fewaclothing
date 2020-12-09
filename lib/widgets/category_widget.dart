import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          child: Image.asset(
            "assets/images/download.jpg",
            height: 70.0,
          ),
          borderRadius: BorderRadius.circular(40.0),
        ),
        Text('Category',
            style: GoogleFonts.dancingScript(
              textStyle: TextStyle(color: Colors.pink, fontSize: 20),
            )),
      ],
    );
  }
}

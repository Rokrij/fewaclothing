import 'package:cached_network_image/cached_network_image.dart';
import 'package:fewaclothing/models/category.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryWidget extends StatelessWidget {
  final FewaCategory category;


  CategoryWidget(this.category);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          child:
          CachedNetworkImage(imageUrl: category.image,height: 70, width: 70,
            placeholder: (context, url) => CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.pink)),),
          borderRadius: BorderRadius.circular(40.0),
        ),
        Text(category.name,
            style: GoogleFonts.nunito(
              textStyle: TextStyle(color: Colors.pink, fontSize: 20),
            )),
      ],
    );
  }
}

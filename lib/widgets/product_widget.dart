import 'package:cached_network_image/cached_network_image.dart';
import 'package:fewaclothing/models/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductWidget extends StatelessWidget {
  final FewaProduct product;

  ProductWidget(this.product);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(imageUrl: product.image,height: 70, width: 70,
          placeholder: (context, url) => CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.pink)),),
        Text(product.name,
            style: GoogleFonts.nunito(
              textStyle: TextStyle(color: Colors.pink, fontSize: 20),
            ),),
      ],
    );
  }


}

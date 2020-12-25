import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      constraints: BoxConstraints.expand(height: 200),
      child: imageSlider(context),
    );
  }
}

Swiper imageSlider(context) {

  return Swiper.children(
    duration: 250,
    autoplay: true,
    // viewportFraction: 0.7,
    // scale: 0.9,
    pagination: new SwiperPagination(
        margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
        builder: new DotSwiperPaginationBuilder(
            color: Colors.white30,
            activeColor: Colors.white,
            size: 0.0,
            activeSize: 0.0),
    ),
    children: <Widget>[
      Image.network(
          "https://mi0.rightinthebox.com/images/dfp/202005/LITB_c71_200225_992320_cp_1_en.jpg?15",
          fit: BoxFit.fill),
      Image.network(
          "https://i.pinimg.com/originals/53/4b/23/534b23f26ccba86efdf270ada6523266.jpg",
          fit: BoxFit.cover),
      Image.network(
          "https://creativemachine.co/wp-content/uploads/2020/03/ecommerce_men_s_clothing_banner_template_13_1200x628.jpg",
          fit: BoxFit.cover),
      Image.network(
          "https://i.pinimg.com/originals/9a/93/ba/9a93ba70bc11f1286419b3fd82b85e09.jpg",
          fit: BoxFit.cover),
    ],
  );
}


import 'package:cached_network_image/cached_network_image.dart';
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
      CachedNetworkImage(
          imageUrl:
              "https://inheriting-addition.000webhostapp.com/images/home_page_banner_3.png",
          fit: BoxFit.fill),
      CachedNetworkImage(
          imageUrl:
              "https://inheriting-addition.000webhostapp.com/images/home_page_banner_2.png",
          fit: BoxFit.fill),
      CachedNetworkImage(
          imageUrl:
              "https://inheriting-addition.000webhostapp.com/images/home_page_banner_4.png",
          fit: BoxFit.fill),
      CachedNetworkImage(
          imageUrl:
              "https://inheriting-addition.000webhostapp.com/images/home_page_banner_1.png",
          fit: BoxFit.fill),
    ],
  );
}

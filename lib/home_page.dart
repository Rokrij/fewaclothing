
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:fewaclothing/models/category.dart';
import 'package:fewaclothing/product_by_category.dart';
import 'package:fewaclothing/providers/category_provider.dart';
import 'package:fewaclothing/widgets/category_widget.dart';
import 'package:fewaclothing/widgets/home_page_dashboard.dart';
import 'package:fewaclothing/widgets/home_page_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FewaCategory> categoryList = [];

  var screenWidth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    categoryList =
        Provider.of<CategoryProvider>(context, listen: true).fewaCategoryList;

    screenWidth = MediaQuery.of(context).size.width;
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
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, 'cart');
                }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 275,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 250.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRightWithFade,
                              child: ProductByCategoryPage(categoryList[0])));
                    },
                    child: Carousel(
                      images: [
                        CachedNetworkImage(
                          imageUrl:
                              "https://inheriting-addition.000webhostapp.com/images/top_image_slider_1.jpg",
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            color: Colors.pink,
                          ),
                        ),
                        CachedNetworkImage(
                          imageUrl:
                              "https://inheriting-addition.000webhostapp.com/images/top_image_slider_2.jpg",
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            color: Colors.pink,
                          ),
                        ),
                        CachedNetworkImage(
                          imageUrl:
                              "https://inheriting-addition.000webhostapp.com/images/top_image_slider_3.jpg",
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            color: Colors.pink,
                          ),
                        ),
                        CachedNetworkImage(
                          imageUrl:
                              "https://inheriting-addition.000webhostapp.com/images/top_image_slider_4.jpg",
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            color: Colors.pink,
                          ),
                        ),
                        CachedNetworkImage(
                          imageUrl:
                              "https://inheriting-addition.000webhostapp.com/images/top_image_slider_5.jpg",
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            color: Colors.pink,
                          ),
                        ),
                        CachedNetworkImage(
                          imageUrl:
                              "https://inheriting-addition.000webhostapp.com/images/top_image_slider_6.jpg",
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            color: Colors.pink,
                          ),
                        ),
                        CachedNetworkImage(
                          imageUrl:
                              "https://inheriting-addition.000webhostapp.com/images/top_image_slider_7.jpg",
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            color: Colors.pink,
                          ),
                        ),
                      ],
                      dotSize: 10,
                      dotSpacing: 25,
                      dotColor: Colors.white,
                      indicatorBgPadding: 5.0,
                      dotBgColor: Colors.transparent,
                      dotIncreasedColor: Colors.pink,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'SHOP BY CATEGORY',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.pink,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                FlatButton(
                  minWidth: 8,
                  height: 30,
                  child: Text(
                    'View All',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'allCategory');
                  },
                ),
              ],
            ),
            Container(
              height: 195,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 4,
                children: List.generate(categoryList.length, (index) {
                  return CategoryWidget(categoryList[index]);
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Special for you',
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Container(
              height: 245,
              child: HomePageSlider(),
            ),
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  height: 200,
                  child: HomeDashBoard(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 20),
                  child: FlatButton(
                    minWidth: 10,
                    color: Colors.pink,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    splashColor: Colors.pinkAccent,
                    child: Text(
                      'SHOP NOW',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'searchDetail');
                    },
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'RECOMMENDED FOR YOU',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

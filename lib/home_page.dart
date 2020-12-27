import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:fewaclothing/models/category.dart';
import 'package:fewaclothing/providers/category_provider.dart';
import 'package:fewaclothing/widgets/category_widget.dart';
import 'package:fewaclothing/widgets/home_page_dashboard.dart';
import 'package:fewaclothing/widgets/home_page_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    categoryList= Provider.of<CategoryProvider>(context,listen:true).fewaCategoryList;

    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.pink),
        title: Text(
          'Fewa Clothing',
          style: GoogleFonts.greatVibes(
            textStyle: TextStyle(color: Colors.pink, fontSize: 35,fontWeight: FontWeight.bold),
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
                    onTap: (){

                    },
                    child: Carousel(
                      images: [
                        CachedNetworkImage(
                          imageUrl: "https://inheriting-addition.000webhostapp.com/images/top_image_slider_1.jpg",
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.pink,),
                        ),CachedNetworkImage(
                          imageUrl: "https://inheriting-addition.000webhostapp.com/images/top_image_slider_2.jpg",
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.pink,),
                        ),CachedNetworkImage(
                          imageUrl: "https://inheriting-addition.000webhostapp.com/images/top_image_slider_3.jpg",
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.pink,),
                        ),CachedNetworkImage(
                          imageUrl: "https://inheriting-addition.000webhostapp.com/images/top_image_slider_4.jpg",
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.pink,),
                        ),CachedNetworkImage(
                          imageUrl: "https://inheriting-addition.000webhostapp.com/images/top_image_slider_5.jpg",
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.pink,),
                        ),CachedNetworkImage(
                          imageUrl: "https://inheriting-addition.000webhostapp.com/images/top_image_slider_6.jpg",
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.pink,),
                        ),CachedNetworkImage(
                          imageUrl: "https://inheriting-addition.000webhostapp.com/images/top_image_slider_7.jpg",
                          //placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.pink,),
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
                  padding: const EdgeInsets.only(left:10),
                  child: Text(
                    'SHOP BY CATEGORY',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.pink,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),

                FlatButton(
                  minWidth: 8,
                  height: 30,
                  child: Text('View All',style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.pink,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      decoration:TextDecoration.underline
                    ),
                  ),
                  ),
                  onPressed: () {
                    print('merry christmas');
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
              padding: const EdgeInsets.only(top:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Special for you',
                      style: GoogleFonts.dancingScript(
                        textStyle: TextStyle(
                            color: Colors.pink,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:10),
                    child: FlatButton(
                      minWidth: 8,
                      height: 30,
                      child: Text('See More'),
                      color: Colors.pink,
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      textColor: Colors.white,
                      onPressed: () {

                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height:245,
              child: HomePageSlider(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Trending Products',
                    style: GoogleFonts.dancingScript(
                      textStyle: TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:10),
                  child: FlatButton(
                    minWidth: 8,
                    height: 30,
                    child: Text('See More'),
                    color: Colors.pink,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    textColor: Colors.white,
                    onPressed: () {

                    },
                  ),
                ),
              ],
            ),
             Container(
                 height:245,
                 child: HomePageSlider(),
             ),
            Stack(
              alignment: Alignment.bottomLeft
              ,
              children: [
                Container(
                height: 200,
                child: HomeDashBoard(),
              ),
                Padding(
                  padding: const EdgeInsets.only(left:30,bottom: 20),
                  child: FlatButton(
                    minWidth: 10,
                    color: Colors.pink,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    splashColor: Colors.pinkAccent,
                    child: Text('SHOP NOW',style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),),
                    onPressed: (){
                      Navigator.pushNamed(context, 'cart');
                    },),
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
                        color: Colors.pink,
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

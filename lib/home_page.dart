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
                    child: Carousel(
                      images: [
                        NetworkImage(
                            'https://cdn.flightclub.com/1800/TEMPLATE/181573/1.jpg'),
                        NetworkImage(
                            'https://cdn.flightclub.com/1800/TEMPLATE/178193/1.jpg'),
                        NetworkImage(
                            'https://cdn.flightclub.com/1800/TEMPLATE/162310/1.jpg'),
                        NetworkImage(
                            'https://cdn.flightclub.com/1800/TEMPLATE/247680/1.jpg'),
                        NetworkImage(
                            'https://cdn.flightclub.com/1800/TEMPLATE/176533/1.jpg'),
                        // ExactAssetImage("assets/images/LaunchImage.jpg")
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
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
            Container(
                height: 200,
                child: HomeDashBoard(),
            ),
            Row(
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

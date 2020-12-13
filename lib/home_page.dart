import 'dart:convert';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:fewaclothing/models/category.dart';
import 'package:fewaclothing/utils/constants.dart';
import 'package:fewaclothing/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Category> categoryList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readCategory();
  }


  @override
  Widget build(BuildContext context) {
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
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
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
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'SHOP BY CATEGORY',
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.pink,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 4,
              children: List.generate(categoryList.length, (index) {
                return CategoryWidget(categoryList[index]);
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                  child: Text(
                'RECOMMENDED FOR YOU',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
  void readCategory() async {
    // isLoading = true;
    var url = "$READ_CATEGORY_URL";
    var response = await http.get(url);

    List<Category> tempList = [];
    List data = json.decode(response.body);
    data.forEach((element) {
      var category = Category.fromJson(element);
        tempList.add(category);
    });
    setState(() {
      categoryList = tempList;
    });

  }
}

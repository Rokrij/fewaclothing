import 'package:fewaclothing/bottom_navigator_page.dart';
import 'package:fewaclothing/cart_page.dart';
import 'package:fewaclothing/home_page.dart';
import 'package:fewaclothing/login_page.dart';
import 'package:fewaclothing/newarrival_page.dart';
import 'package:fewaclothing/product_details.dart';
import 'package:fewaclothing/profile_items/about_us_page.dart';
import 'package:fewaclothing/profile_items/my_account_page.dart';
import 'package:fewaclothing/profile_items/notification_page.dart';
import 'package:fewaclothing/profile_page.dart';
import 'package:fewaclothing/providers/category_provider.dart';
import 'package:fewaclothing/providers/product_provider.dart';
import 'package:fewaclothing/providers/trending_product_provider.dart';
import 'package:fewaclothing/providers/user_auth_provider.dart';
import 'package:fewaclothing/search_page.dart';
import 'package:fewaclothing/signup_page.dart';
import 'package:fewaclothing/splash_screen.dart';
import 'package:fewaclothing/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider.value(
        value: UserAuthProvider(),
      ),
      ChangeNotifierProvider.value(
        value: CategoryProvider(),
      ),
      ChangeNotifierProvider.value(
        value: ProductProvider(),
      ),ChangeNotifierProvider.value(
        value: TrendingProductProvider(),
      ),
    ], child: MyApp()),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<UserAuthProvider>(context,listen:false).getEmail();
    Provider.of<CategoryProvider>(context,listen:false).fetchCategory();
    Provider.of<ProductProvider>(context,listen:false).fetchProduct();
    Provider.of<TrendingProductProvider>(context,listen:false).fetchTrendingProduct();

    return MaterialApp(
      home: SignUpPage(),
      theme: ThemeData(
        primaryColor: Colors.pink,
        textTheme: GoogleFonts.josefinSansTextTheme(
          Theme.of(context).textTheme,),
        accentColor: Colors.pink[400],
        accentColorBrightness: Brightness.light,
         splashColor: Colors.transparent
      ),
      routes: <String, WidgetBuilder>{
        'login': (BuildContext context) => LoginPage(),
        'signUp': (BuildContext context) => SignUpPage(),
        'home': (BuildContext context) => HomePage(),
        'nav': (BuildContext context) => BottomNavPage(),
        'splash': (BuildContext context) => SplashScreen(),
        'wishList': (BuildContext context) => WishListPage(),
        'search': (BuildContext context) => SearchPage(),
        'profile': (BuildContext context) => ProfilePage(),
        'cart': (BuildContext context) => CartPage(),
        'new': (BuildContext context) => NewArrivalPage(),
        'account': (BuildContext context) => MyAccount(),
        'notification': (BuildContext context) => NotificationPage(),
        'aboutUs': (BuildContext context) => AboutUs(),
      },
      initialRoute: 'splash',
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:fewaclothing/providers/user_auth_provider.dart';
import 'package:fewaclothing/utils/constants.dart';
import 'package:fewaclothing/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _obsecurePassword = true;

  var email;
  var password;

  final _globalKeyScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKeyScaffold,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/22.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom:70),
                  child: Image(
                    image: AssetImage('assets/images/3.png'),
                    height: 225,
                    //fit: BoxFit.fill,
                  ),
                ),
                TextField(
                  controller: emailController,
                  decoration:
                      InputDecoration(icon: Icon(Icons.mail), labelText: 'Email'),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock_rounded),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: (_obsecurePassword
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                        onPressed: () {
                          setState(() {
                            _obsecurePassword = !_obsecurePassword;
                          });
                        },
                      ),
                  ),
                  obscureText: _obsecurePassword,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 40, 20, 10),
                  child: FlatButton(
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    color: Colors.pink,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    splashColor: Colors.pinkAccent,
                    onPressed: () {
                      email = emailController.text;
                      password = passwordController.text;
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        showSnackBar("All fields are required !!!");
                      } else {
                        loginUser();
                      }
                    },
                    child: Text(
                      "LOG IN",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 20, 10),
                  child: Row(
                    children: <Widget>[
                      Text('Dont have an account ? ',style: TextStyle( fontWeight: FontWeight.bold),),
                      FlatButton(
                        textColor: Colors.pink,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'signUp', (route) => false);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.pink,
      duration: const Duration(seconds: 3),
      content: Text(message,style: GoogleFonts.dancingScript(
        textStyle: TextStyle(
            color: Colors.white),
      ),),
    );
    _globalKeyScaffold.currentState.showSnackBar(snackBar);
  }

  void loginUser() async {
    onLoading(context);
    var url = "$LOGIN_URL?email=$email&password=$password";
    var response = await http.get(url);
    Navigator.pop(context);
    if (response.body.contains("Login")) {
      Provider.of<UserAuthProvider>(context,listen:false).saveEmail(email);
      Navigator.pushNamedAndRemoveUntil(context, 'nav', (route) => false);
    } else {
      showSnackBar("Invalid Email or Password ! Please Try  Again");
    }
  }
}

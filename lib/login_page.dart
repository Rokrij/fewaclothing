import 'package:fewaclothing/providers/user_auth_provider.dart';
import 'package:fewaclothing/utils/constants.dart';
import 'package:fewaclothing/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      backgroundColor: Colors.white,
      key: _globalKeyScaffold,
      //appBar: AppBar(title: Text('NOTES',style: TextStyle(fontSize: 40, color: Colors.pink))),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/download.jpg'),
                height: 150,
                width: 150,
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
                    )),
                obscureText: _obsecurePassword,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 40, 20, 10),
                child: FlatButton(
                  color: Colors.pink,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  splashColor: Colors.blueAccent,
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
                    Text('Dont have an account ? '),
                    FlatButton(
                      textColor: Colors.pink,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'signUp', (route) => false);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(message),
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

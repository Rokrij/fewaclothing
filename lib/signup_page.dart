import 'package:fewaclothing/utils/constants.dart';
import 'package:fewaclothing/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var name;
  var email;
  var password;

  bool _obsecurePassword = true;
  bool _obsecureConfirmPassword = true;

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
                controller: nameController,
                decoration: InputDecoration(
                    icon: Icon(Icons.person), labelText: 'Name'),
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
              TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock_rounded),
                    labelText: 'Confirm Password',
                    suffixIcon: IconButton(
                      icon: (_obsecureConfirmPassword
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off)),
                      onPressed: () {
                        setState(() {
                          _obsecureConfirmPassword = !_obsecureConfirmPassword;
                        });
                      },
                    )),
                obscureText: _obsecureConfirmPassword,
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
                    name = nameController.text;
                    email = emailController.text;
                    password = passwordController.text;
                    if (nameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty) {
                      showSnackBar("All fields are required");
                    } else {
                      registerUser();
                    }
                  },
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: Row(
                  children: <Widget>[
                    Text('Already have an account ? '),
                    FlatButton(
                      textColor: Colors.pink,
                      child: Text(
                        'Log In',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'login', (route) => false);
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
      backgroundColor: Colors.black,
      content: Text(message),
    );
    _globalKeyScaffold.currentState.showSnackBar(snackBar);
  }

  void registerUser() async {
    onLoading(context);
    var url = "$SIGNUP_URL?name=$name&email=$email&password=$password";
    var response = await http.get(url);
    Navigator.pop(context);
    if (response.body.contains("Successful")) {
      saveEmail();
      Navigator.pushNamedAndRemoveUntil(context, 'nav', (route) => false);
    } else if (response.body.contains("exists")) {
      showSnackBar("Email Already Exists");
    } else {
      showSnackBar("Something is Wrong !");
    }
  }

  void saveEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }
}
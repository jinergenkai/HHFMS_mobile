import 'dart:async';
import 'package:flutter/material.dart';
import 'package:homekitchen_customer_mobile/domain/auth/authentication.dart';
import 'package:homekitchen_customer_mobile/blocs/login_bloc.dart';
import 'package:homekitchen_customer_mobile/presentation/navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  LoginBloc _loginBloc = new LoginBloc();
  TextEditingController _usernameController = TextEditingController(text: "nmhung");
  TextEditingController _passwordController = TextEditingController(text: "nmhung");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*logo*/
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 1.0, color: Colors.lightBlueAccent)),
                  child: FlutterLogo(),
                ),
              ),
              /*app name*/
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("MomKitchen", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightBlueAccent, fontSize: 30)),
              ),
              /*username input*/
              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: StreamBuilder(
                  stream: _loginBloc.userStream,
                  builder: (context, snapshot) => TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(errorText: snapshot.hasError ? snapshot.error.toString() : null, labelText: "Tên đăng nhập", labelStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                ),
              ),
              /*password input*/
              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: Stack(alignment: AlignmentDirectional.centerEnd, children: <Widget>[
                  StreamBuilder(
                      stream: _loginBloc.passStream,
                      builder: (conterxt, snapshot) => TextField(
                            obscureText: !_showPassword,
                            controller: _passwordController,
                            decoration:
                                InputDecoration(errorText: snapshot.hasError ? snapshot.error.toString() : null, labelText: "Password", labelStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                          )),
                  GestureDetector(onTap: onToggleShowPassword, child: Text(!_showPassword ? "Show" : "Hide", style: TextStyle(color: Colors.lightBlueAccent))),
                ]),
              ),
              /*sign in button*/
              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: onSignInClick, style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue), child: Text("Sign In", style: TextStyle(color: Colors.white)))),
              ),
              /*other method login*/
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("New user? Sign Up"),
                  Text("Forgot password?"),
                ],
              ),
              SizedBox(height: 20),
              Text("Or"),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 2, 50, 2),
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: null, style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue), child: Text("Google", style: TextStyle(color: Colors.white)))),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 2, 50, 2),
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: null, style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue), child: Text("Facebook", style: TextStyle(color: Colors.white)))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSignInClick() {
    /*check input valid*/
    registerUser("email123@gmail.com", "123456");
    if (_loginBloc.isValidInfo(_usernameController.text, _passwordController.text)) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const FooterBar()));
    }
  }

  void onToggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}

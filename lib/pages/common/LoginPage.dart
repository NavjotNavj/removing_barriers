import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

// import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:removing_barriers/models/LoginModel.dart';
import 'package:removing_barriers/utils/Navigation.dart';
import 'package:removing_barriers/widgets/BezierContainer.dart';
import 'package:removing_barriers/widgets/ProgressContainerView.dart';
import 'package:removing_barriers/utils/Globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

import 'SignUpPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool type = true;
  bool passObscure = true;
  late String password;
  late String mobileNumber;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> _mobNoKey = GlobalKey<FormFieldState>();

  final myEmailController = TextEditingController();
  final myPasswordController = TextEditingController();

  Future<LoginModel>? _futureLogin;

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryMobileField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              controller: myEmailController,
              key: _mobNoKey,
              validator: (val) {
                if (val!.isEmpty)
                  return "enter mobile number";
                else if (val.length < 6) {
                  return "enter valid mobile number";
                }
                return null;
              },
              onSaved: (val) {
                mobileNumber = val!;
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryPasswordField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              onSaved: (val) => password = val!,
              controller: myPasswordController,
              validator: (val) {
                if (val!.isEmpty) {
                  return "enter password";
                }
                return null;
              },
              obscureText: passObscure,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        validation();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff48e0fb), Color(0xff2bd8f7)])),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/homescreen");
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff1959a9),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('f',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff2872ba),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Log in with Facebook',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SignUpPage(
                      title: "SignUp Page",
                    )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color(0xff4ff1f7),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Remov',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xff4ff1f7),
          ),
          children: [
            TextSpan(
              text: 'ing',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: ' Barriers',
              style: TextStyle(
                color: Color(0xff4ff1f7),
                fontSize: 30,
              ),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryMobileField("Email id"),
        _entryPasswordField("Password"),
      ],
    );
  }

  @override
  void dispose() {
    // cleaning up the controller when the widget is disposed

    myEmailController.dispose();
    myPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        // body: Observer(
        // builder: (_) {
        //   return

        body: SingleChildScrollView(
      child: _futureLogin == null
          ? Form(
              key: _formKey,
              child: Container(
                height: height,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: -height * .15,
                        right: -MediaQuery.of(context).size.width * .4,
                        child: BezierContainer()),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: height * .2),
                            _title(),
                            Switch(
                                value: type,
                                onChanged: (value) {
                                  setState(() {
                                    type = value;
                                  });
                                }),
                            Text(type ? "User" : "Doctor"),
                            SizedBox(height: 50),
                            _emailPasswordWidget(),
                            SizedBox(height: 20),
                            _submitButton(),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.centerRight,
                              child: Text('Forgot Password ?',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ),
                            _divider(),
                            _facebookButton(),
                            SizedBox(height: height * .055),
                            _createAccountLabel(),
                          ],
                        ),
                      ),
                    ),
                    Positioned(top: 40, left: 0, child: _backButton()),
                  ],
                ),
              ),
            )
          : FutureBuilder<LoginModel>(
              future: _futureLogin,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // print("data received");
                  // return Padding(
                  //   padding: const EdgeInsets.all(30.0),
                  //   child: Center(child: Text(snapshot.data.data.email)),
                  // );
                  _saveDetailsToSharedPref(
                      snapshot.data!.data!.token!, snapshot.data!.data!.name!);

                  SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
                    Navigation.navigateToHomeScreen(context);
                  });
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Center(child: Text("${snapshot.error}")),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
    )
        // },
        // ),
        );
  }

  void getData() {
    mobileNumber = myEmailController.text;
    password = myPasswordController.text;
  }

  void validation() {
    getData();
    if (mobileNumber.length <= 0 || !validateEmail(mobileNumber)) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Please enter a correct email address"),
      ));
    } else if (password.length <= 0) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Password field is empty"),
      ));
    } else {
      setState(() {
        _futureLogin = emailApiHit(mobileNumber, password);
      });
    }
  }

  //used for validating email in flutter
  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    return (!regex.hasMatch(value)) ? false : true;
  }

  Future<LoginModel> emailApiHit(String email, String password) async {
    final uri = 'https://removingbarriers.herokuapp.com/auth';
    var requestBody = {
      'email': email,
      'password': password,
    };
    final http.Response response = await http.post(
      Uri.parse(uri),
      //   headers: <String, String>{
      // "Content-Type": "application/x-www-form-urlencoded",
      //     // 'Content-Type': 'application/json; charset=UTF-8',
      //   },
      body: requestBody,
    );

    if (response.statusCode == 200) {
      return LoginModel.fromJson(jsonDecode(response.body));
    } else {
      print("ERRORR in logging");

      throw Exception('Failded to login');
    }
  }

  void _saveDetailsToSharedPref(String token, String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('name', name);
  }
}

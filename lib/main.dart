import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:studiomallia/view/menuprincipal.dart';

import 'database/app_database.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WidgetLogin(),
    );
  }
}

class WidgetLogin extends StatefulWidget {
  @override
  _WidgetLoginState createState() => _WidgetLoginState();
}

class _WidgetLoginState extends State<WidgetLogin> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Color gradient_1 = Color.fromRGBO(255, 192, 203, 1);
  Color gradient_2 = Color.fromRGBO(255, 192, 203, 0.95);
  Color gradient_3 = Color.fromRGBO(255, 255, 255, 0.92);
  Color gradient_4 = Color.fromRGBO(255, 255, 255, 0.91);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('pictures/sallon.jpg'), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                gradient_1.withOpacity(0.7),
                gradient_2,
                gradient_3,
                gradient_4
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: size.width,
              height: size.width / 2,
              child: Image.asset('pictures/logostudiomallia.png',
                  filterQuality: FilterQuality.high),
            ),
            Form(
              key: _formKey,
              child: Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(32.0, 8, 32, 0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Usuario',
                                labelStyle: GoogleFonts.ptSans(
                                    color: Color.fromRGBO(222, 72, 111, 1)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(222, 72, 111, 1)),
                                  //  when the TextFormField in unfocused
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(222, 72, 111, 1)),
                                  //  when the TextFormField in focused
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Insira seu usuário';
                                }
                                return null;
                              },
                            )),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(32.0, 8, 32, 0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Senha',
                                labelStyle: GoogleFonts.ptSans(
                                    color: Color.fromRGBO(222, 72, 111, 1)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(222, 72, 111, 1)),
                                  //  when the TextFormField in unfocused
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(222, 72, 111, 1)),
                                  //  when the TextFormField in focused
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Insira sua senha';
                                }
                                return null;
                              },
                            )),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(32.0, 32, 32, 0),
                          child: ButtonTheme(
                            minWidth: size.width,
                            height: 40.0,
                            child: RaisedButton(
                              color: Color.fromRGBO(222, 72, 111, 1),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              menuprincipal()));
                                }
                              },
                              child: Text(
                                'Entrar',
                                style: GoogleFonts.ptSans(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}



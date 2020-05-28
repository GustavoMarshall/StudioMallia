import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studiomallia/view/cadastrar.dart';
import 'package:studiomallia/view/agendar.dart';
import 'package:studiomallia/view/consultar.dart';
import 'package:studiomallia/main.dart';
import 'package:studiomallia/view/telaCliente.dart';

class menuprincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle style = TextStyle(
        fontFamily: 'Montserrat', fontSize: 20.0, fontWeight: FontWeight.bold);

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: size.width,
              height: size.height / 3,
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 192, 203, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset('pictures/logostudiomallia.png',
                          filterQuality: FilterQuality.high),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Menu principal',
                        style: GoogleFonts.ptSans(
                            color: Color.fromRGBO(222, 72, 111, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: size.width / 2,
                        height: size.height / 4,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => agendar()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 192, 203, 1),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.calendar_today,
                                  size: 64,
                                  color: Color.fromRGBO(222, 72, 111, 1),
                                ),
                                Text(
                                  'Agendar',
                                  style: GoogleFonts.ptSans(
                                      color: Color.fromRGBO(222, 72, 111, 1),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SizedBox(
                        width: size.width / 2,
                        height: size.height / 4,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => TelaCliente()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 192, 203, 1),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.people,
                                  size: 64,
                                  color: Color.fromRGBO(222, 72, 111, 1),
                                ),
                                Text(
                                  'Clientes',
                                  style: GoogleFonts.ptSans(
                                      color: Color.fromRGBO(222, 72, 111, 1),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: size.width / 2,
                        height: size.height / 4,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => consultar()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 192, 203, 1),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.list,
                                  size: 64,
                                  color: Color.fromRGBO(222, 72, 111, 1),
                                ),
                                Text(
                                  'Consultar',
                                  style: GoogleFonts.ptSans(
                                      color: Color.fromRGBO(222, 72, 111, 1),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SizedBox(
                        width: size.width / 2,
                        height: size.height / 4,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => MyApp()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 192, 203, 1),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.exit_to_app,
                                  size: 64,
                                  color: Color.fromRGBO(222, 72, 111, 1),
                                ),
                                Text(
                                  'Sair',
                                  style: GoogleFonts.ptSans(
                                      color: Color.fromRGBO(222, 72, 111, 1),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

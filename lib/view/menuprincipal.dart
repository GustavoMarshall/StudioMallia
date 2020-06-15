import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studiomallia/view/cadastrar.dart';
import 'package:studiomallia/view/agendar.dart';
import 'package:studiomallia/view/agendamentos_page.dart';
import 'package:studiomallia/main.dart';
import 'package:studiomallia/view/telaCliente.dart';

class menuprincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle style = TextStyle(
        fontFamily: 'Montserrat', fontSize: 20.0, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.exit_to_app),
                color: Color.fromRGBO(222, 72, 111, 1),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                      builder: (BuildContext context) => MyApp()));
                },
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 192, 203, 1),
        elevation: 0,
        leading: Icon(
          Icons.http,
          color: Color.fromRGBO(255, 192, 203, 1),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: size.width,
              height: size.height / 4.5,
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
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: SizedBox(
                      width: size.width - 16,
                      height: size.height / 4,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Consultar()));
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
                                'Agendamentos',
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
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: SizedBox(
                      width: size.width - 16,
                      height: size.height / 4,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      TelaCliente()));
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
          ],
        ),
      ),
    );
  }
}

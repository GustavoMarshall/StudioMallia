import 'package:flutter/material.dart';

class Consultar extends StatelessWidget{

  TextStyle style = TextStyle(
      fontFamily: 'Montserrat', fontSize: 20.0, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Consultar"),
        backgroundColor: Colors.pink,
      ),

      body: Center(

        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child:
                TextField(
                  keyboardType: TextInputType.datetime,
                  obscureText: false,
                  style: style,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: 'Selecione a data para busca',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((40))
                    )
                  ),
                ),
              ),



                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 8, right: 180, left: 180),
                  child: ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      child: RaisedButton(
                        color: Color(0xff4caf50),
                        child: Text(
                          "Buscar",
                          textAlign: TextAlign.center,
                          style: style.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: (){

                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular((40))
                        ),
                      ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Text(
                    "Clientes agendado",
                    style: style,
                  ),
                ),



            ]
          ),
              ),

          ),


        );


  }


  















}
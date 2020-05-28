

import 'package:flutter/material.dart';

class agendar extends StatelessWidget{
  TextEditingController _clieController = TextEditingController();
  TextEditingController _horaController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  @override
  Widget build(BuildContext context) {
        TextStyle style = TextStyle(
        fontFamily: 'Montserrat', fontSize: 20.0, fontWeight: FontWeight.bold);



    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Agendar Cliente"),backgroundColor: Colors.pink,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.save),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(40),
          child: ListView(
            children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: TextField(
                controller: _clieController,
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                  hintText: 'Cliente',
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular((40)),
                ),
                )

              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: TextField(
              controller: _dataController,
              keyboardType: TextInputType.number,
              obscureText: false,
              style: style,
                decoration: InputDecoration(
                  hintText: 'Data de agendamento',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular((40)),
                  )
                ),


            ),
          ),


              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: TextField(
                    controller: _horaController,
                    keyboardType: TextInputType.number,
                  obscureText: false,
                  style: style,
                  decoration: InputDecoration(
                    hintText: 'Horário',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((40)),

                    )
                  )

                ),
              ),


              TextField(
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                  hintText: 'Serviço',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular((40))
                  )
                ),
              ),

//              Padding(
//                padding: const EdgeInsets.only(top: 60, bottom: 8, right: 180, left: 180),
//                child: ButtonTheme(
//                  minWidth: MediaQuery.of(context).size.width,
//                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//                  child: RaisedButton(
//                    color: Color(0xff4caf50),
//                    child: Text(
//                      "Salvar",
//                      textAlign: TextAlign.center,
//                      style: style.copyWith(
//                        color: Colors.white, fontWeight: FontWeight.bold
//                      )
//                    ),
//
//                    onPressed: (){
//                      agendarAlerta(context);
//
//                    },shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular((40))
//
//                  )
//
//                  ),
//
//                ),
//              )


            ],

          ),
        ),
      ),
    );
  }


    void agendarAlerta(BuildContext context) {
      var alertDialog = AlertDialog(
        title: Text("${_clieController.text} foi agendada com sucesso0!"),

      );
      showDialog(
          context: context, builder: (BuildContext context) => alertDialog);
    }


}


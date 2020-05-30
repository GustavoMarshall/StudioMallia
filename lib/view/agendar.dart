

import 'package:flutter/material.dart';
import 'package:studiomallia/view/consultar.dart';
import 'package:studiomallia/models/agendamento.dart';

class agendar extends StatelessWidget{
  TextEditingController _clieController = TextEditingController();
  TextEditingController _horaController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _servicoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
        TextStyle style = TextStyle(
        fontFamily: 'Montserrat', fontSize: 20.0, fontWeight: FontWeight.bold);



    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Agendar Cliente"),backgroundColor: Colors.pink,
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
                controller: _servicoController,
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                  hintText: 'Serviço',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular((40))
                  )
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: (){
          final String clienteAgenda = _clieController.text;
          final String dataAgenda = _dataController.text;
          final String horaAgenda = _horaController.text;
          final String servicoAgenda = _servicoController.text;

          final Agendamento newAgendamento = Agendamento(0, clienteAgenda ,dataAgenda,
          horaAgenda , servicoAgenda );
          _dao.save(newAgendamento).then((id) => Navigator.pop(context));

        },
      ) ,
    );
  }



}


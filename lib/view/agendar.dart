
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:studiomallia/database/dao/agendamentos_dao.dart';
import 'package:studiomallia/models/agendamentos.dart';
import 'package:studiomallia/view/consultar.dart';
import 'package:studiomallia/models/agendamentos.dart';
import 'package:studiomallia/view/menuprincipal.dart';

class Agendar extends StatefulWidget {
  @override
  _AgendaFormState createState() => _AgendaFormState();
}

class _AgendaFormState extends State<Agendar> {

  TextEditingController _clieController = TextEditingController();
  TextEditingController _horaController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _servicoController = TextEditingController();
  String agendamento_label = 'Data de Agendamento';
  final AgendamentosDao _dao = AgendamentosDao();

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
        fontFamily: 'Montserrat', fontSize: 20.0, fontWeight: FontWeight.bold);


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Agendar Cliente"), backgroundColor: Colors.pink,
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
                  child: OutlineButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 16, 8.0, 16),
                          child: Text(agendamento_label, style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey[600]
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 16, 8.0, 16),
                          child: Icon(
                            Icons.calendar_today, color: Colors.grey[600],),
                        )
                      ],
                    ),
                    onPressed: () async {
                      final dtPick = await showDatePicker(context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1980),
                          lastDate: DateTime(2100));
                      print(dtPick);
                      String data_formatada = formatDate(
                          dtPick, [dd, '/', mm, '/', yyyy]);
                      print(data_formatada);

                      setState(() {
                        agendamento_label = data_formatada;
                      });

                      _dataController.text = data_formatada;
                    },
                  )
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
        onPressed: () {
          final String clienteAg = _clieController.text;
          final String dataAg = _dataController.text;
          final String horaAg = _horaController.text;
          final String servicoAg = _servicoController.text;

          final Agendamentos newAgendamento = Agendamentos(0, clienteAg, dataAg,
              horaAg, servicoAg);
          _dao.save(newAgendamento).then((id) => Navigator.pop(context));
        },
        child: Icon(Icons.save),
      ),
    );
  }

}



